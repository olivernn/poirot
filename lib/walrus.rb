require 'walrus/handler'
require 'walrus/view'

ActionView::Template.register_template_handler(:mustache, Walrus::Handler)
