module Poirot
  module ViewHelper
    def csrf_token
      tag(:input, :name => 'authenticity_token', :type => 'hidden', :value => form_authenticity_token)
    end
  end
end
