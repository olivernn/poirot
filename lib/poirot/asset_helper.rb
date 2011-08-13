module Poirot
  module AssetHelper
    def template_include_tag(*sources)
      sources.collect do |source|
        template = File.open(_poirot_resolve_partial_path(source), "rb")
        content_tag :script, template.read.html_safe, :type => "text/mustache", :id => "#{source.parameterize.dasherize}-template"
      end.join("\n").html_safe
    end
    
    def _poirot_resolve_partial_path(source)
      if source.to_s =~ /^\// # absolute path to a different view folder
        segments = source.to_s.split('/')
        partial_name = "_#{segments.pop}.html.mustache"
        segments << partial_name
        Rails.root.join('app/views', *segments)
      else
        Rails.root.join('app/views', controller_name, "_#{source}.html.mustache")
      end
    end
    
  end
end