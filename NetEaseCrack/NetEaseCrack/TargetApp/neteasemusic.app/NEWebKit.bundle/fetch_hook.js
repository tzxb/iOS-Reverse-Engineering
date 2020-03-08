if (window.fetch) {
    var oldFetch = window.fetch
    window.fetch = function(input, opts) {
        var resolve = () => {};
        var reject = () => {};
        var promiseObj =new Promise((res, rej)=> {
            resolve=res;
            reject=rej;
        });

        function setParam() {
            var inputResolve = () => {};
            var inputReject = () => {};
            var inputPromise = new Promise((res, rej) => {
                inputResolve = res;
                inputReject = rej;
            })
            if (opts && opts.method) {
                method = opts.method.toUpperCase();
                if (opts.body && (method !== 'GET' && method !== "TRACE")) {

                    var identifier = (new Date()).getTime();
                    input = NEUpdateQueryStringParameter(input, "netease_webkit_ajax_identifier", identifier)
                    NEStringFromBody(opts.body, function(body, type) {
                        var data = {
                            'netease_webkit_ajax_identifier': identifier,
                            'args': body,
                            'type': type,
                        }
                        window.webkit.messageHandlers.NEWebURLProtocolBrigeName.postMessage(data)
                        NEWebURLProtocolCallbacks[identifier] = function() {
                            inputResolve();
                        }
                    });
                } else {
                    inputResolve();
                }
            } else {
                inputResolve();
            }
            return inputPromise;
        }
        //timeout
        var timeout = opts && opts.timeout;
        if(timeout){
            setTimeout(() => {
                reject(new Error("fetch timeout"))
            }, timeout)
        }
        setParam().then(() => {
            return oldFetch(input, opts)
        }).then(
            (res) => {
                resolve(res)
            },
            (err) => {
                reject(err)
            }
        );
        return promiseObj;
    }
}