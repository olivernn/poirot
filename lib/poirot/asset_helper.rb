module Poirot
  module AssetHelper
    def template_include_tag(*sources)
      sources.collect do |source|
        template_path = Rails.root.join('app/views', controller_name, "_#{source}.html.mustache")
        template = File.open(template_path, "rb")
        content_tag :script, template.read.html_safe, :type => "text/mustache", :id => "#{source.dasherize}-template"
      end.join("\n").html_safe
    end
  end
end