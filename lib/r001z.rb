# frozen_string_literal: true

require_relative "r001z/version"

module R001z
  class App
    def call(env)
      kl, act = cont_and_act(env)
      text = kl.new(env).send(act)
      [
        200, 
        {'Content-type' => 'text/html'},
        [text]
      ]
    end

    def cont_and_act(env)
      _, con, act, after = env["PATH_INFO"].split("/")
      con = con.capitalize + "Controller"
      [Object.const_get(con), act] 
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
  
  class Error < StandardError; end
  # Your code goes here...
end
