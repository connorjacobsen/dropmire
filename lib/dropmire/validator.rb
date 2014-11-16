require 'dropmire/error/parse_error'

module Dropmire
  class Validator
    def initialize(text)
      @text = text
      validate
    end

    def validate
      if regex.match(@text).to_s == ""
        raise ParseError.new("Malformed input string", @text)
      end
    end

    def regex
      /%\w*\^\w*\$\w*\$\w*\^[\w\s]*\^\s*\?;\d*=\d*=\?\+\!\s*\d*[\s\w]*\?/
    end
  end
end