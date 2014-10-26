require 'dropmire/ext/string'

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
      @attrs = {:address=>{}} # empty hash for the parsed values
    end

    def attrs
      @attrs
    end

    def text
      @text
    end

    def parse
      parse_methods.each { |method| self.send method }
    end

    def parse_methods
      [ :parse_address, :parse_carrot_string, :date_of_birth, :zipcode,
        :license_class, :expiration_date, :parse_license_num ]
    end

    def parse_address
      addr = address(@text)
      @attrs[:address][:state] = state(addr)
      @attrs[:address][:city] = city(addr)

      [@attrs[:address][:city], @attrs[:address][:state]]
    end

    def address(text)
      /\A[%][a-zA-Z\s]*/.match(text).to_s
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
      ary = street.split(' ')
      str = []
      ary.each do |s|
        str << s.capitalize
      end
      @attrs[:address][:street] = str.join(' ')
    end

    def zipcode
      str = /![\s]*[0-9]*/.match(@text).to_s
      zip = str[1..(str.length)].strip
      @attrs[:address][:zipcode] = zip[0,5]
    end

    def license_class
      str = /![\s]*[0-9]*[\s]*[A-Z]/.match(@text).to_s
      @attrs[:license_class] = str[-1]
    end

    def id_string
      /;[0-9]*=/.match(@text).to_s.gsub(/[;=]/, '')
    end

    def iin(str)
      @attrs[:iin] = str[0,6]
    end

    def license_num(str)
      num_len = str.length - 8
      @attrs[:license_num] = str[6,2].to_char.upcase + str[8, num_len]
    end

    def parse_license_num
      id_str = id_string
      iin(id_str)
      license_num(id_str)
    end

    def expiration_date
      str = /=[0-9]{4}/.match(@text).to_s
      @attrs[:expiration_date] = transform_date str[1,4]
    end

    def date_of_birth
      str = /=[0-9]*/.match(@text).to_s
      dob = str[5,8]
      year = dob[0,4]
      month = str[3,2]
      day = dob[6,2]
      @attrs[:date_of_birth] = "#{year}-#{month}-#{day}"
    end

    def transform_date(date)
      y = date[0,2]
      m = date[2,2]
      "20#{y}-#{m}"
    end
  end
end
