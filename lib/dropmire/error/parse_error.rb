require File.join(File.dirname(__FILE__), 'error')

module Dropmire
  class ParseError < Error
    def initialize(message="Malformed input string", text=nil)
      super(message, text)
    end

    def to_s
      "Parse" + super
    end
  end
end