if (window.XMLHttpRequest && window.XMLHttpRequest.prototype) {
    var t = XMLHttpRequest.prototype.open
    XMLHttpRequest.prototype.open = function() {
        
        if (arguments[0]) {
            var method = arguments[0].toUpperCase()
            if (method !== "GET" && method !== "TRACE") {
                var identifier = (new Date()).getTime()
                arguments[1] = NEUpdateQueryStringParameter(arguments[1], "netease_webkit_ajax_identifier", identifier)
                this['__identifier'] = identifier
                if (arguments[2] == false) {
                    this['__async'] = false
                }
            }
        }
        t.apply(this, arguments)
    }
    
    var e = XMLHttpRequest.prototype.send
    XMLHttpRequest.prototype.send = function() {
        
        var identifier = this['__identifier']
        if (identifier && arguments[0]) {
            var that = this
            NEStringFromBody(arguments[0], function(body, type) {
                var data = {
                    'netease_webkit_ajax_identifier': identifier,
                    'args': body,
                    'type': type,
                }
                // 通知客户端保存 body
                window.webkit.messageHandlers.NEWebURLProtocolBrigeName.postMessage(data)
                if (that['__async'] == false) {
                    e.apply(that, arguments)
                }
                else {
                    NEWebURLProtocolCallbacks[identifier] = function() {
                        e.apply(that, arguments)
                    }
                }
            })
        }
        else {
            e.apply(this, arguments)
        }
    }
}
