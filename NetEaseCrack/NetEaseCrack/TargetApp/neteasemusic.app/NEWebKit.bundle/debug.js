var oldLog = console.log
console.log = function() {

	const message = {
		"type": "info",
		"data": Array.prototype.slice.call(arguments),
	}
    window.webkit.messageHandlers.NEWebLogMessageHandlderName.postMessage(message)

    if (oldLog) {
    	oldLog.apply(this, arguments)
    }
}