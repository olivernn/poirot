module Walrus
  class Handler < ActionView::Template::Handler
    include ActionView::Template::Handlers::Compilable

    self.default_format = :mustache

    def compile(template)
      view_path = "#{template.virtual_path}_view"
      abs_view_path = Rails.root.join('app/views', view_path)
      if File.exists? "#{abs_view_path}.rb"
        require abs_view_path
        view_class = view_path.sub('/_','/').classify.constantize
        Rails.logger.debug(view_class)
      else
        view_class = Walrus::View
      end
      "#{view_class}.new(self, '#{template.source.gsub(/'/, "\\\\'")}').render.html_safe"
    end
  end
end