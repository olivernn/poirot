module Walrus
  module AssetHelper
    def template_include_tag(*sources)
      sources.collect do |source|
        template_path = Rails.root.join('app/views', source)
        template = File.open(template_path, "rb")
        content_tag :script, template.read, :type => "text/mustache"
      end.join("\n").html_safe
    end
  end
end