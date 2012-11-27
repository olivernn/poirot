module Poirot
  module AssetHelper
    def template_include_tag(*sources)
      sources.collect do |source|
        template = File.open(resolve_partial_path(source), "rb")
        content_tag :script, template.read.html_safe, :type => "text/mustache", :id => "#{template_name(source).parameterize.dasherize}-template"
      end.join("\n").html_safe
    end

    private

    def is_absolute_path?(source)
      source.to_s =~ /^\//
    end

    def template_name(source)
      if is_absolute_path?(source)
        source.to_s.split('/').last
      else
        source
      end
    end

    def resolve_partial_path(source)
      if is_absolute_path?(source)
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