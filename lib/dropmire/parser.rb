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

    def carrot_string
      str = /\^(.*)\^/.match(@text).to_s
      len = str.length-2
      str[1..len].split('^')
    end

    def parse_carrot_string
      name_string, street_string = carrot_string
      names split_name(name_string)
      street street_string
    end

    def parse_address
      addr = address
      @attrs[:state] = state(addr)
      @attrs[:city]  = city(addr)
      [@attrs[:city], @attrs[:state]]
    end

    def split_name(name)
      name.split('$')
    end

    def names(names)
      @attrs[:name] = {
        first:  names[1].capitalize,
        last:   names[0].capitalize,
        middle: names[2].capitalize
      }
    end

    def street(street)
      @attrs[:address] = {
        street: street
      }
    end
  end
end