;(function () {
  poirot._viewFactory = function (template, partials) {
    var compiledTemplate = Hogan.compile(template)
    return function (data) {
      return $(compiledTemplate.render(data, partials))
    }
  }
})()