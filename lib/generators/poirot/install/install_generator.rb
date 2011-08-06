require 'rails'

module Poirot
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs Poirot JavaScript helper"
      source_root File.expand_path('../../../../../vendor/assets/javascripts/poirot', __FILE__)

      def copy_mustache
        say_status("copying", "Mustache.js", :green)
        copy_file "mustache.js", "public/javascripts/mustache.js"
      end

      def copy_poirot
        say_status("copying", "poirot.js", :green)
        copy_file "poirot.js", "public/javascripts/poirot.js"
      end
    end
  end
end if ::Rails.version < "3.1"