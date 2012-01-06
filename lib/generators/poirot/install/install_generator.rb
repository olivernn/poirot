require 'rails'

module Poirot
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs Poirot JavaScript helper"
      source_root File.expand_path('../../../../../vendor/assets/javascripts', __FILE__)

      def copy_mustache
        say_status("copying", "Mustache.js", :green)
        copy_file "poirot-mustache/mustache.js", "public/javascripts/mustache.js"
      end

      def copy_poirot
        say_status("copying", "poirot.js", :green)
        copy_file "poirot-base/poirot.js", "public/javascripts/poirot.js"
      end

      def copy_poirot_handlebars
        say_status("copying", "poirot-handlebars.js", :green)
        copy_file "poirot-handlebars/poirot-handlebars.js", "public/javascripts/poirot-handlebars.js"
      end

      def copy_poirot_hogan
        say_status("copying", "poirot-hogan.js", :green)
        copy_file "poirot-hogan/poirot-hogan.js", "public/javascripts/poirot-hogan.js"
      end
    end
  end
end if ::Rails.version < "3.1"