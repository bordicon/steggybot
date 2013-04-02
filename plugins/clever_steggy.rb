require 'cinch'
require 'cleverbot'
require 'pry'

module Plugins
  class CleverSteggy
    include Cinch::Plugin

    match /clever (.+)/
    @help_hash = {
      clever: "Usage: !clever COMMENT"
    }

    def initialize(*args)
      super
      @client = Cleverbot::Client.new
    end

    def execute(m, query)
      m.reply @client.write(query)
    end
  end
end
