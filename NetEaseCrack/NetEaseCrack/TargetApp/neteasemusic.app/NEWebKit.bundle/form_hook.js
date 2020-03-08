function NEWebKitGetFormData(targetURL) {
    var forms = document.getElementsByTagName('form')
    var targetForm
    for (var i = 0; i < forms.length; i++) {
        var action = forms[i].getAttribute('action')
        var urlRegx = new RegExp(action + '$')
        if (urlRegx.test(targetURL)) {
            targetForm = forms[i]
            break
        }
    }
    if (!targetForm) return
    var formData = new FormData(targetForm)
    var resultArr = []
    for (var pair of formData.entries()) {
        resultArr.push(pair[0] + '=' + pair[1])
    }
    return resultArr.join('&')
}
