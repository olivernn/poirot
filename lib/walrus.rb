require 'walrus/handler'
require 'walrus/view'
require 'walrus/asset_helper'

ActionView::Template.register_template_handler(:mustache, Walrus::Handler)
ActionView::Base.send :include, Walrus::AssetHelper