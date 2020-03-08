; (function() {
    if (window.baoyun && window.baoyun.injected) {
        return;
    }
    var baoyun = window.baoyun || {
        callbackFunIndex: new Date().getTime(),
        injected: true,
        send: function(command, params, callback) {
            if (window['__bridge']) {
                __bridge.sendCommand(command, params, callback);
            } else {
                var fn = (this.callbackFunIndex++) + '';
                window[fn] = function(data){
                    if (callback) {
                        callback(data);
                    }
                    window[fn] = null;
                }
                window.webkit.messageHandlers.__bridge.postMessage({command:command, params:params, callback:fn});
            }
        },
        loading: false
    };
    var isEmpty = function(v) {
        if (typeof(v) !== 'undefined' && v != null && v.length > 0) {
            return false;
        };
        return true;
    }
    baoyun.log = function(content) {
        var $this = this;
        $this.send('log', {
            'content': content,
        }, null);
    };
    baoyun.login = function(data){
        var $this = this;
        if (typeof(data) == 'string') {
            try {
                data = JSON.stringify(data);
            } catch (e) {
                data = null;
            }
        }
        if (!data) {
            data = {};
        }
        $this.send('login', data, null);
    };
    baoyun.disableVideo = function() {
        var videos = document.getElementsByTagName('video');
        for (var i = videos.length - 1; i >= 0; i--) {
            var video = videos[i];
            video.play = function() {};
            video.load = function() {};
        };
    };
    baoyun.jsonp = function(url, callback, functionName) {
        var f = functionName;
        if (!f) {
            f = 'jsonp_' + (new Date()).getTime();
        };
        url += f;
        window[f] = function(data) {
            callback(data);
            window[f] = null;
        }
        var script = document.createElement("script");
        script.type = "text/javascript";
        // 设置要远程的url
        script.src = url;
        window.document.body.appendChild(script);
    }
    baoyun.json = function(url, callback, addHeaders) {
        var xmlhttp = null;
        if (window.XMLHttpRequest) { // code for all new browsers
            xmlhttp = new XMLHttpRequest();
        }
        if (!xmlhttp) {
            callback(null);
            return;
        };
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4) { // 4 = "loaded"
                if (xmlhttp.status == 200) { // 200 = OK
                    var j = null;
                    try {
                        j = JSON.parse(xmlhttp.responseText);
                    } catch(e) {}
                    callback(j);
                } else {
                    callback(null);
                }
            } else if (xmlhttp.readyState == 1) {
                if (typeof(addHeaders) === 'function') {
                    addHeaders(xmlhttp);
                };
            }
        };
        xmlhttp.open("GET", url, true);
        xmlhttp.send(null);
    };
    baoyun.parseVideoSource = function(source, ispad) {
        var $this = baoyun;
        var newEvent = function(event) {
            var event1 = document.createEvent('HTMLEvents');
            event1.initEvent(event, true, true);
            event1.eventType = 'message';
            return event1;
        }
        var isEmpty = function(v) {
            if (typeof(v) !== 'undefined' && v != null && v.length > 0) {
                return false;
            };
            return true;
        }
        var parse97pdVideo = function(){
            return parseIframeVideoTagSource();
        }
        var parseVideoTagSource = function(w) {
            if (!w) {
              w = window;
            }
            var videos = w.document.getElementsByTagName('video');
            if (videos.length == 0) {
                return null;
            }
            var video = videos[0];
            var src = video.getAttribute('src');
            if (!isEmpty(src)) {
                src = trim(src);
                if (src.indexOf('http') != 0) {
                    //相对路径转绝对路径
                    src = absolutizeURI(w.location.href, src);
                };
                var map = {
                    '2': src
                };
                return JSON.stringify(map);
            };
            return null;
        }
        var parseIframeVideoTagSource = function() {
          function _parseIframeVideoTagSource(win) {
            if (!win) {
              return null;
            }
            var result = parseVideoTagSource(win);
            if (result) {
                return result;
            }
            var frames = win.document.getElementsByTagName('iframe');
            if (!frames || frames.length == 0) {
              return null;
            }
            for (var i = 0; i < frames.length; i++) {
              var frame = frames[i];
              var level = _parseIframeVideoTagSource(frame.contentWindow);
              if (level) {
                return level;
              }
            }
            return null;
          }
          return _parseIframeVideoTagSource(window);
        }
        var md5 = function(str) {
            function a(b, a, c, d, l, m) {
                b = g(g(a, b), g(d, m));
                return g(b << l | b >>> 32 - l, c)
            }
            function b(b, c, d, g, l, m, n) {
                return a(c & d | ~c & g, b, c, l, m, n)
            }
            function c(b, c, d, g, l, m, n) {
                return a(c & g | d & ~g, b, c, l, m, n)
            }
            function d(b, c, d, g, l, m, n) {
                return a(d ^ (c | ~g), b, c, l, m, n)
            }
            function g(b, a) {
                var c = (b & 65535) + (a & 65535);
                return (b >> 16) + (a >> 16) + (c >> 16) << 16 | c & 65535
            }
            function hash(e) {
                for (var h = [], f = 0; f < 8 * e.length; f += 8) h[f >> 5] |= (e.charCodeAt(f / 8) & 255) << f % 32;
                e = 8 * e.length;
                h[e >> 5] |= 128 << e % 32;
                h[(e + 64 >>> 9 << 4) + 14] = e;
                e = 1732584193;
                for (var f = -271733879,
                k = -1732584194,
                l = 271733878,
                m = 0; m < h.length; m += 16) {
                    var n = e,
                    s = f,
                    t = k,
                    q = l;
                    e = b(e, f, k, l, h[m + 0], 7, -680876936);
                    l = b(l, e, f, k, h[m + 1], 12, -389564586);
                    k = b(k, l, e, f, h[m + 2], 17, 606105819);
                    f = b(f, k, l, e, h[m + 3], 22, -1044525330);
                    e = b(e, f, k, l, h[m + 4], 7, -176418897);
                    l = b(l, e, f, k, h[m + 5], 12, 1200080426);
                    k = b(k, l, e, f, h[m + 6], 17, -1473231341);
                    f = b(f, k, l, e, h[m + 7], 22, -45705983);
                    e = b(e, f, k, l, h[m + 8], 7, 1770035416);
                    l = b(l, e, f, k, h[m + 9], 12, -1958414417);
                    k = b(k, l, e, f, h[m + 10], 17, -42063);
                    f = b(f, k, l, e, h[m + 11], 22, -1990404162);
                    e = b(e, f, k, l, h[m + 12], 7, 1804603682);
                    l = b(l, e, f, k, h[m + 13], 12, -40341101);
                    k = b(k, l, e, f, h[m + 14], 17, -1502002290);
                    f = b(f, k, l, e, h[m + 15], 22, 1236535329);
                    e = c(e, f, k, l, h[m + 1], 5, -165796510);
                    l = c(l, e, f, k, h[m + 6], 9, -1069501632);
                    k = c(k, l, e, f, h[m + 11], 14, 643717713);
                    f = c(f, k, l, e, h[m + 0], 20, -373897302);
                    e = c(e, f, k, l, h[m + 5], 5, -701558691);
                    l = c(l, e, f, k, h[m + 10], 9, 38016083);
                    k = c(k, l, e, f, h[m + 15], 14, -660478335);
                    f = c(f, k, l, e, h[m + 4], 20, -405537848);
                    e = c(e, f, k, l, h[m + 9], 5, 568446438);
                    l = c(l, e, f, k, h[m + 14], 9, -1019803690);
                    k = c(k, l, e, f, h[m + 3], 14, -187363961);
                    f = c(f, k, l, e, h[m + 8], 20, 1163531501);
                    e = c(e, f, k, l, h[m + 13], 5, -1444681467);
                    l = c(l, e, f, k, h[m + 2], 9, -51403784);
                    k = c(k, l, e, f, h[m + 7], 14, 1735328473);
                    f = c(f, k, l, e, h[m + 12], 20, -1926607734);
                    e = a(f ^ k ^ l, e, f, h[m + 5], 4, -378558);
                    l = a(e ^ f ^ k, l, e, h[m + 8], 11, -2022574463);
                    k = a(l ^ e ^ f, k, l, h[m + 11], 16, 1839030562);
                    f = a(k ^ l ^ e, f, k, h[m + 14], 23, -35309556);
                    e = a(f ^ k ^ l, e, f, h[m + 1], 4, -1530992060);
                    l = a(e ^ f ^ k, l, e, h[m + 4], 11, 1272893353);
                    k = a(l ^ e ^ f, k, l, h[m + 7], 16, -155497632);
                    f = a(k ^ l ^ e, f, k, h[m + 10], 23, -1094730640);
                    e = a(f ^ k ^ l, e, f, h[m + 13], 4, 681279174);
                    l = a(e ^ f ^ k, l, e, h[m + 0], 11, -358537222);
                    k = a(l ^ e ^ f, k, l, h[m + 3], 16, -722521979);
                    f = a(k ^ l ^ e, f, k, h[m + 6], 23, 76029189);
                    e = a(f ^ k ^ l, e, f, h[m + 9], 4, -640364487);
                    l = a(e ^ f ^ k, l, e, h[m + 12], 11, -421815835);
                    k = a(l ^ e ^ f, k, l, h[m + 15], 16, 530742520);
                    f = a(k ^ l ^ e, f, k, h[m + 2], 23, -995338651);
                    e = d(e, f, k, l, h[m + 0], 6, -198630844);
                    l = d(l, e, f, k, h[m + 7], 10, 1126891415);
                    k = d(k, l, e, f, h[m + 14], 15, -1416354905);
                    f = d(f, k, l, e, h[m + 5], 21, -57434055);
                    e = d(e, f, k, l, h[m + 12], 6, 1700485571);
                    l = d(l, e, f, k, h[m + 3], 10, -1894986606);
                    k = d(k, l, e, f, h[m + 10], 15, -1051523);
                    f = d(f, k, l, e, h[m + 1], 21, -2054922799);
                    e = d(e, f, k, l, h[m + 8], 6, 1873313359);
                    l = d(l, e, f, k, h[m + 15], 10, -30611744);
                    k = d(k, l, e, f, h[m + 6], 15, -1560198380);
                    f = d(f, k, l, e, h[m + 13], 21, 1309151649);
                    e = d(e, f, k, l, h[m + 4], 6, -145523070);
                    l = d(l, e, f, k, h[m + 11], 10, -1120210379);
                    k = d(k, l, e, f, h[m + 2], 15, 718787259);
                    f = d(f, k, l, e, h[m + 9], 21, -343485551);
                    e = g(e, n);
                    f = g(f, s);
                    k = g(k, t);
                    l = g(l, q)
                }
                h = [e, f, k, l];
                e = "";
                for (f = 0; f < 4 * h.length; f++) e += "0123456789abcdef".charAt(h[f >> 2] >> f % 4 * 8 + 4 & 15) + "0123456789abcdef".charAt(h[f >> 2] >> f % 4 * 8 & 15);
                return e
            }
            return hash(str);
        }
        var params = function(url) {
            var params = {};
            if (typeof(url) === 'undefined' || url == null) {
                return params;
            };
            var i = url.indexOf('?');
            if (i < 0) {
                return params;
            };
            var ps = url.substring(i+1, url.length).split('&');
            for (var i = ps.length - 1; i >= 0; i--) {
                var s = ps[i];
                var index = s.indexOf('=');
                if (index <= 0) {
                    continue;
                };
                params[s.substring(0, index)] = s.substring(index + 1, s.length);
            };
            return params;
        }
        var trim = function(str){
    　　     return str.replace(/(^\s*)|(\s*$)/g, "");
    　　 }
        var absolutizeURI = function(base, href) { // RFC 3986
            function parseURI(url) {
                var m = String(url).replace(/^\s+|\s+$/g, '').match(/^([^:\/?#]+:)?(\/\/(?:[^:@]*(?::[^:@]*)?@)?(([^:\/?#]*)(?::(\d*))?))?([^?#]*)(\?[^#]*)?(#[\s\S]*)?/);
                // authority = '//' + user + ':' + pass '@' + hostname + ':' port
                return (m ? {
                    href: m[0] || '',
                    protocol: m[1] || '',
                    authority: m[2] || '',
                    host: m[3] || '',
                    hostname: m[4] || '',
                    port: m[5] || '',
                    pathname: m[6] || '',
                    search: m[7] || '',
                    hash: m[8] || ''
                }: null);
            }
            function removeDotSegments(input) {
                var output = [];
                input.replace(/^(\.\.?(\/|$))+/, '').replace(/\/(\.(\/|$))+/g, '/').replace(/\/\.\.$/, '/../').replace(/\/?[^\/]*/g,
                function(p) {
                    if (p === '/..') {
                        output.pop();
                    } else {
                        output.push(p);
                    }
                });
                return output.join('').replace(/^\//, input.charAt(0) === '/' ? '/': '');
            }

            href = parseURI(href || '');
            base = parseURI(base || '');

            return ! href || !base ? null: (href.protocol || base.protocol) + (href.protocol || href.authority ? href.authority: base.authority) + removeDotSegments(href.protocol || href.authority || href.pathname.charAt(0) === '/' ? href.pathname: (href.pathname ? ((base.authority && !base.pathname ? '/': '') + base.pathname.slice(0, base.pathname.lastIndexOf('/') + 1) + href.pathname) : base.pathname)) + (href.protocol || href.authority || href.pathname ? href.search: (href.search || base.search)) + href.hash;
        }
        if (source === '97pd') {
            return parse97pdVideo();
        }
        return parseIframeVideoTagSource();
    };
    baoyun.hackVideoFullScreen = function(){
        var videos = document.getElementsByTagName('video');
        for(var i = 0; i < videos.length; ++i) {
            videos[i].removeAttribute("webkit-playsinline");
        }
    };
    baoyun.currentVideo = function() {
        var videos = document.getElementsByTagName('video');
        if(videos.length > 0) {
            return videos[0];
        }
        return null;
    };
    //web播放统计时长要用，勿删
    baoyun.videoCurrentPlayTime = function(){
        var videos = document.getElementsByTagName('video');
        if(videos.length > 0) {
            return videos[0].currentTime;
        }
        return 0;
    };
    baoyun.parseVideoInfo = function(isIpad){
        var host = window.location.host;
        function onGotVideo(video){
            if (!video) {
                return null;
            };
            var result = {};
            result.code = 0;
            result.video = video;
            return JSON.stringify(result);
        }
        function parseBilibiliVideoInfo() {
            var fields = null;
            if (window.__INITIAL_STATE__ && window.__INITIAL_STATE__.reduxAsyncConnect
                && window.__INITIAL_STATE__.reduxAsyncConnect
                && window.__INITIAL_STATE__.reduxAsyncConnect.videoInfo) {
                fields = window.__INITIAL_STATE__.reduxAsyncConnect.videoInfo;
            } else if (window.__INITIAL_STATE__ && window.__INITIAL_STATE__.videoData) {
                fields = window.__INITIAL_STATE__.videoData;
            } else {
                return;
            }
            var title = fields.title;
            var image = fields.litpic || fields.pic;
            var video = {};
            video.title = title;
            video.thumb = image;
            var url = window.location.href;
            video.sourceUrl = url;
            var source = {};
            source.page = url;
            source.src = 'bilibili';
            video.sources = [source];
            return onGotVideo(video);
        };
        if (host.indexOf('bilibili.com') >= 0) {
            return parseBilibiliVideoInfo();
        };
        var result = {code:200021};
        return JSON.stringify(result);
    };
    baoyun.parseVideoSourceNew = function(src, isIpad, airPlay, mode) {
        var $this = this;
        if (!src) {
            src = $this.srcForLocation();
        }
        if (mode == 1) {
            //获取video标签
            var video = baoyun.currentVideo();
            if (!video) {
                return null;
            }
            var duration = video.duration;
            if (isNaN(duration)) {
                duration = 0;
            }
            if (duration > 120) {
                var result = {};
                var source = {};
                source.page = window.location.href;
                source.src = src;
                source.srcName = $this.srcName(src);
                var level = {};
                level.level = 2;
                level.playUrl = video.src;
                source.levels = [level];
                result.source = source;
                video.pause();
                return JSON.stringify(result);
            }
            return null;
        } else if (mode == 2) {
            if (window.parseFailed) {
                return;
            }
            if (window.parseResult) {
                return JSON.stringify(window.parseResult);
            }
            if (window.parsing) {
                return;
            }
            if (!window.firstParseDate) {
                window.firstParseDate = new Date();
            }
        }
        return null;
    };
    baoyun.srcForLocation = function() {
        var page = window.location.href;
        if (!page) {
            return '';
        }
        var ms = page.match(/http[s]?:\/\/(.*?)([:\/]|$)/);
    	if (!ms || ms.length < 2) {
    		return null;
    	};
    	var domain = ms[1];
    	if (domain.indexOf('iqiyi.com') >= 0) {
    		return 'iqiyi';
    	};
    	if (domain.indexOf('open.youku.com') >= 0) {
    		return 'youkuyun';
    	};
    	if (domain.indexOf('youku.com') >= 0) {
    		return 'youku';
    	};
        if (domain.indexOf('tudou.com') >= 0) {
    		return 'tudou';
    	};
    	if (domain.indexOf('bilibili.com') >= 0) {
    		return 'bilibili';
    	};
    	if (domain.indexOf('qq.com') >= 0) {
    		return 'qq';
    	};
    	if (domain.indexOf('yinyuetai.com') >= 0) {
    		return 'yyt';
    	};
    	if (domain.indexOf('sohu.com') >= 0) {
    		return 'sohu';
    	};
    	if (domain.indexOf('miaopai.com') >= 0) {
    		return 'miaopai';
    	};
    	if (domain.indexOf('ku6.com') >= 0) {
    		return 'ku6';
    	};
    	if (domain.indexOf('toutiao.com') >= 0) {
    		return 'toutiao';
    	}
        return '';
    };
    baoyun.srcName = function(src) {
        if (!src) {
            return '';
        }
        if (src == 'youku') {
            return '优酷';
        }
        if (src == 'tudou') {
            return '土豆';
        }
        if (src == 'iqiyi') {
            return '爱奇艺';
        }
        if (src == 'sohu') {
            return '搜狐';
        }
        if (src == 'bilibili') {
            return 'Bilibili';
        }
        return '';
    };
    baoyun.getCookie = function(name) {
        var arr,reg=new RegExp("(^| )"+ name +"=([^;]*)(;|$)"); //正则匹配
        if (arr = document.cookie.match(reg)) {
            return unescape(arr[2]);
        } else {
            return null;
        }
    };
    baoyun.uuid = function() {
    	return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    		var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
    		return v.toString(16);
    	}).toUpperCase();
    };
    window.baoyun = baoyun;
})();
