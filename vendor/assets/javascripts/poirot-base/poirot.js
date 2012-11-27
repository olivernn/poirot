var poirot = (function ($) {

  var viewFactory = function (template, partials) {
    return function (data) {
      return $(Mustache.to_html(template, data, partials))
    }
  }

  var loadTemplates = function () {
    $('script[type="text/mustache"]').each(function () {
      var template = $(this).html()
      var methodName = this.id.replace(/-([a-z])/g, function (str) {
        return str.replace("-", "").toUpperCase()
      }).replace("Template", "")

      poirot._partials[methodName] = template

      poirot[methodName] = poirot._viewFactory(template, poirot._partials)
    })
  }

  var poirot = {
    _partials: {},
    _viewFactory: viewFactory,
    _loadTemplates: loadTemplates
  }

  $(document).ready(loadTemplates)

  return poirot
})(jQuery)