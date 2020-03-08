var NEWebURLProtocolCallbacks = {}
function NEWebURLProtocolCallback(identifier) {

    var callback = NEWebURLProtocolCallbacks[identifier]
    if (callback) {
    	callback()
    	delete NEWebURLProtocolCallbacks[identifier]
    }    
}

function NEUpdateQueryStringParameter(uri, key, value) {

    var separator = uri.indexOf('?') !== -1 ? "&" : "?"
    return uri + separator + key + "=" + value
}

function NEPostErrorMessage(errorReason) {
    var data = {
       'errorReason': errorReason,
       'type': "error",
    }
    window.webkit.messageHandlers.NEWebURLProtocolBrigeName.postMessage(data)
}

function NEStringFromBody(body, callback) {

	if (typeof body == 'string') {
		callback(body)
	}
	else if(typeof body == 'object') {

		if (body instanceof ArrayBuffer) {
			body = new Blob([body])
		}
		if (body instanceof Blob) {
			var reader = new FileReader()
			reader.addEventListener("loadend", function() {				
				callback(reader.result.split(",")[1], "base64")
			})
			reader.readAsDataURL(body)
		}
		else if(body instanceof FormData) {
		    var resultArr = []
		    for (var pair of body.entries()) {
		        resultArr.push(pair[0] + '=' + pair[1])
		    }
		    callback(resultArr.join('&'))
		    NEPostErrorMessage("无法处理 FormData")
		}
		else {
			callback(body)			
		    NEPostErrorMessage("无法处理的数据")
		}
	}
	else {
		callback(body)
		NEPostErrorMessage("无法处理的数据")
	}
}
