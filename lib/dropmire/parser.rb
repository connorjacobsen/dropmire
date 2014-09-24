module Dropmire
  class Parser
    # Public: Creates a new Dropmire::Parser.
    #
    # text - The String text to parse.
    # options - The Hash of initialization options for the Parser.
    #
    # Examples
    #
    #   Dropmire::Parser.new file.read
    #   # => { first_name => "John", ... }
    #
    # Returns the Hash of results from the string.
    def initialize(text, options = {})
      @text = text
      @attrs = {} # empty hash for the parsed values
    end

    def attrs
      @attrs
    end

    def address
      /\A[%][a-zA-Z]*/.match(@text).to_s
    end

    def state(addr)
      addr[1..2]
    end

    def city(addr)
      l = addr.length-1
      addr[3..l].capitalize
    end

    def parse_address
      addr = address
      @attrs[:state] = state(addr)
      @attrs[:city]  = city(addr)
      [@attrs[:city], @attrs[:state]]
    end
  end
end