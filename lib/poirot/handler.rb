module Poirot
  class Handler
    def self.call(template)
      view_path = "#{template.virtual_path}_view"
      abs_view_path = Rails.root.join('app/views', view_path)
      view_class = begin
        view_path.classify.constantize
      rescue NameError => e
        Poirot::View
      end
      "#{view_class}.new(self, '#{template.source.gsub(/'/, "\\\\'")}').render.html_safe"
    end
  end
end
