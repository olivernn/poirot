require 'walrus/handler'
require 'walrus/view'
require 'walrus/asset_helper'

ActionView::Template.register_template_handler(:mustache, Walrus::Handler)
ActionView::Base.send :include, Walrus::AssetHelper

module Walrus
  class Railtie < Rails::Railtie

    config.before_configuration do |app|
      app.config.autoload_paths += %W(#{app.config.root}/app/views)
    end

  end
end