# frozen_string_literal: true

require "hub_spot/configuration"
require "hub_spot/http"
require "hub_spot/http_api_calls/base"
require "hub_spot/http_api_calls/error"
require "hub_spot/http_api_calls/contact/create_or_update"
require "hub_spot/contact"
require "hub_spot/oauth"
require "hub_spot/oauth/token"
require "hub_spot/oauth/token_store"
require "hub_spot/oauth/client"
require "hub_spot/version"

module HubSpot
  module_function

  # From @avdi per http://www.virtuouscode.com/2009/11/20/hash-transforms-in-ruby/
  def transform_hash(original, options={}, &block)
    original.inject({}){|result, (key,value)|
      value = if (options[:deep] && Hash === value) 
                transform_hash(value, options, &block)
              else 
                value
              end
      block.call(result,key,value)
      result
    }
  end

  # Convert keys to strings
  def stringify_keys(hash)
    transform_hash(hash) {|hash, key, value|       
      hash[key.to_s] = value
    }
  end
end
