require 'dropmire/parser'

module Dropmire
  class Identity
    def initialize(text)
      p = Parser.new(text)
      p.parse

      @attrs = p.attrs
    end

    # naive method approach
    def address
      { street: street, city: city, state: state, zipcode: zipcode }
    end

    def street
      attrs[:address][:street]
    end

    def city
      attrs[:address][:city]
    end

    def state
      attrs[:address][:state]
    end

    def zipcode
      attrs[:address][:zipcode]
    end

    def names
      { first: first_name, middle: middle_name, last: last_name }
    end

    def first_name
      attrs[:name][:first]
    end

    def middle_name
      attrs[:name][:middle]
    end

    def last_name
      attrs[:name][:last]
    end

    def drivers_license_number
      attrs[:license_num]
    end

    def drivers_license_iin
      attrs[:iin]
    end

    def drivers_license_class
      attrs[:license_class]
    end

    def drivers_license_expiration_date
      attrs[:expiration_date]
    end

    def date_of_birth
      attrs[:date_of_birth]
    end

    # For meta attr methods later...
    #
    # def method_missing(method, *args, &block)
    #   if addr_lookup method.to_s
        
    #   else
    #     super
    #   end
    # end

    private

      def attrs
        @attrs
      end

      # def attr_lookup(attr)
      #   if attrs.has_key? attr
      #   elsif address_vars
      #   elsif name_vars
      #   else
      #   end
      # end

      # def address_vars
      #   %w(street city state zipcode)
      # end

      # def name_vars
      #   %w(first middle last first_name middle_name last_name)
      # end
  end
end