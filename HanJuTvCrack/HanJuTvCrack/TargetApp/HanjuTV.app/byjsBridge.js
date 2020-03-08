var global = this;
(function(context) {
    context.log = _bridge_log;
    context.printThread = _bridge_print_thread;
    if (context.console) {
        var jsLogger = context.console.log;
        context.console.log = function() {
            context.log.apply(context, arguments);
            if (jsLogger) {
                jsLogger.apply(context.console, arguments);
            }
        }
    } else {
        context.console = {
            log: context.log
        }
    }
    if (!context.modules) {
        context.modules = {};
    }
    if (!context.hasIncludeUrls) {
        context.hasIncludeUrls = {};
    }

    function includeModules(ms, callback) {
        if (ms.length == 0) {
            callback(true);
            return;
        }
        var name = ms.shift();
        if (name) {
            name = name.trim();
        }
        if (!name) {
            includeModules(ms, callback);
            return;
        }
        var url = context.modules[name] || name;
        if (context.hasIncludeUrls[url]) {
            includeModules(ms, callback);
            return;
        }
        context._bridge_download_string(name, function(js) {
            if (!js) {
                callback(false);
                return;
            }
            eval(js);
            context.hasIncludeUrls[url] = true;
            includeModules(ms, callback);
        });
    };
    context.include = function(ms, callback) {
        var ms = ms.split(',');
        includeModules(ms, callback);
    };
    context.requestData = function(url, headers, callback) {
        var request = {
            url: url,
            method: 'GET'
        };
        if (headers) {
            request.headers = headers;
        }
        context._bridge_http_request(request, function(data, code) {
            if (code >= 400 || !data || data.length == 0) {
                callback(null);
                return;
            }
            callback(data);
        });
    };
    context.requestString = function(url, headers, callback) {
        context.requestData(url, headers, function(data) {
            if (!data) {
                callback(null);
                return;
            }
            var str = data.bridge_utf8String();
            callback(str);
        });
    };
    context.requestJson = function(url, headers, callback) {
        context.requestString(url, headers, function(str) {
            if (!str) {
                callback(null);
                return;
            }
            var json = null;
            try {
                json = JSON.parse(str);
            } catch (e) {
                context.log(e);
            }
            callback(json);
        });
    };
    context.requestJsonp = function(url, callbackName, headers, callback) {
        if (!callbackName) {
            callbackName = 'jsonp_' + new Date().getTime();
            if (url[url.length - 1] == '=') {
                url += callbackName;
            } else {
                url += '&callback=' + callbackName;
            }
        }
        context[callbackName] = function(data) {
            return data;
        };
        requestString(url, headers, function(str) {
            var data = eval(str);
            context[callbackName] = null;
            if (!data) {
                data = null;
            }
            callback(data);
        });
    };
    context.require = function(key) {
        var val = context[key];
        if (!val) {
            val = {};
        }
        if (!val.instancesRespondToSelector) {
            val.instancesRespondToSelector = function(selector) {
                return val[selector] ? true : false;
            };
        }
        if (!val.respondsToSelector) {
            val.respondsToSelector = function(selector) {
                return val[selector] ? true : false;
            };
        }
        if (!val.alloc) {
            val.alloc = function() {
                return val;
            };
        }
        if (!val.init) {
            val.init = function() {
                return val;
            };
        }
        return val;
    };
    context.block = function(types, f) {
        return f;
    };
})(global);
