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

    def full_name_string
      str = /[\^][A-Z]*[\$][A-Z]*[\$][A-Z]*[\^]/.match(@text).to_s
      len = str.length-2
      str[1..len]
    end

    def split_name
      full_name_string.split('$')
    end

    def set_names
      names = split_name
      @attrs[:first_name] = names[1].capitalize
      @attrs[:last_name]  = names[0].capitalize
      @attrs[:middle_name]  = names[2].capitalize
      [@attrs[:first_name], @attrs[:middle_name], @attrs[:last_name]]
    end
  end
end