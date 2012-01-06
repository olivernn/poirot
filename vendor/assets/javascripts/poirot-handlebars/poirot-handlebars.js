;(function () {
  poirot._viewFactory = function (template, partials) {
    var compiledTemplate = Handlebars.compile(template)
    return function (data) {
      return $(compiledTemplate(data))
    }
  }
})()
