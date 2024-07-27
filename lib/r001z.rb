# frozen_string_literal: true

require_relative "r001z/version"

module R001z
  class App
    def call(env)
      [
        200, 
        {'Content-type' => 'text/html'},
        ["hello web !!!"]
      ]
    end
  end
  
  class Error < StandardError; end
  # Your code goes here...
end
