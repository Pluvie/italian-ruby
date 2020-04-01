##
# Core Ext - Rack Test

module Rack
  class MockResponse
    alias       :stato              :status
    alias       :corpo              :body
    alias       :intestazioni       :original_headers
    alias       :ha_intestazione?   :has_header?

    def converti_corpo_in_json
      JSON.parse corpo
    end
  end
end