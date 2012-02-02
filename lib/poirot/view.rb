module Poirot
  class View < Mustache

    def initialize(view_context, template_source)
      @view_context = view_context
      @params = view_context.params || {}
      self.template = template_source
      assign_variables!
    end

    self.template_extension = 'html.mustache'

    def self.inherited(view_class)
      self.template_path = Rails.root.join('app', 'views', view_class.name.split('::').first.downcase)
    end

    def respond_to?(method_sym, include_private = false)
      if view_context.respond_to?(method_sym)
        true
      else
        super
      end
    end

    def render_buffer(buffer)
      self.render(buffer, context).html_safe
    end

    def include_partial(name)
      path = ["app/views", controller_name]
      path += name.split("/")
      path.delete(nil)
      path.last.replace("_#{path.last}.html.mustache")

      filename = path.join("/")

      Dir.chdir(Rails.root) do
        render_buffer(File.read(filename))
      end
    end

    def method_missing(method_name, *args, &block)
      if instance_variable_names.include?("@#{method_name}") && args.empty?
        instance_variable_get("@#{method_name}")
      else
        view_context.send(method_name,*args, &block)
      end
    end

    private

    attr_reader :view_context
    attr_reader :params

    def assign_variables!
      variables = view_context.instance_variable_names.select{|name| name =~ /^@[^_]/}
      variables.each do |name|
        instance_var = view_context.instance_variable_get(name)
        instance_variable_set(name, instance_var)
        self[name.tr('@','').to_sym] = instance_var
      end

      if Rails.version >= "3.1"
        # get the locals from the view context, is there a better way?
        locals = view_context.send(:view_renderer).send(:_partial_renderer).instance_variable_get("@locals") || {}

        locals.each do |name, val|
          instance_variable_set("@#{name}", val)
          self[name] = val
        end
      end
    end
  end
end