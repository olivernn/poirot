require 'poirot/handler'
require 'poirot/view'
require 'poirot/asset_helper'

ActionView::Template.register_template_handler(:mustache, Poirot::Handler)
ActionView::Base.send :include, Poirot::AssetHelper

module Poirot
  class Railtie < Rails::Railtie

    config.before_configuration do |app|
      app.config.autoload_paths += %W(#{app.config.root}/app/views)
    end

  end
end