var poirot = (function ($) {

  var poirot = {
    partials: {}
  }

  $(document).ready(function () {
    $('script[type="text/mustache"]').each(function () {
      var template = $(this).text()
      var methodName = this.id.replace(/-([a-z])/g, function (str) {
        return str.replace("-", "").toUpperCase()
      }).replace("Template", "")

      poirot.partials[methodName] = template

      poirot[methodName] = function (presenter) {
        return $(Mustache.to_html(template, presenter, poirot.partials))
      }
    })
  })

  return poirot
})(jQuery)