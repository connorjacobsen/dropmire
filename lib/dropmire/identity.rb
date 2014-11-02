require 'dropmire/parser'

module Dropmire
  class Identity
    def initialize(text)
      p = Parser.new(text)
      p.parse

      @attrs = p.attrs
    end
    
    def method_missing(method, *args, &block)
      is_attr = attrs.fetch(method, nil)
      if is_attr.nil? && !(dl_id_values.include?(method))
        super
      else
        key = find_key_from_method(method)
        attrs[key]
      end
    end

    private

      def attrs
        @attrs
      end

      def dl_id_values
        [:drivers_license_expiration_date, :drivers_license_iin,
         :drivers_license_number]
      end

      def find_key_from_method(method)
        case method.to_s
        when 'drivers_license_expiration_date'
          :expiration_date
        when 'drivers_license_iin'
          :iin
        when 'drivers_license_number'
          :license_num
        else
          method
        end
      end

      def drivers_license_attrs
        %w(expiration_date iin )
      end
  end
end