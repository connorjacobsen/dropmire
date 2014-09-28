# Implementation of the Soundex phonetic algorithm for indexing names
# by sound, as pronounced in English.
module Dropmire
  module Soundex
    class << self
      def soundex(str_or_arr)
        case str_or_arr
        when String
          build_code_for(str_or_arr)
        when Array
          str_or_arr.collect { |str| build_code_for(str) }
        else
          nil
        end
      end

      def build_code_for(str)
        str = str.upcase.gsub(/[^A-Z]/, '')
        return nil if str.empty?

        soundex_code = str[0]
        last_code = get_code str[0]
        # str = remove_chars(str)

        len = str.length
        str[0..len].chars.each_index do |index|
          return soundex_code if soundex_code.length == 4

          code = get_code str[index]
          if code == '0'
            unless %w(W H).include? str[index]
              last_code = nil
            end
          elsif code != last_code
            soundex_code += code
            last_code = code
          end
        end

        return soundex_code.ljust(4, '0')
      end

      def remove_chars(str)
        str.gsub(/[AEHIOUWY]/, '')
      end

      def get_code(char)
        case char
        when 'B', 'F', 'P', 'V'
          '1'
        when 'C', 'G', 'J', 'K', 'Q', 'S', 'X', 'Z'
          '2'
        when 'D', 'T'
          '3'
        when 'L'
          '4'
        when 'M', 'N'
          '5'
        when 'R'
          '6'
        else
          '0'
        end
      end
    end
  end
end