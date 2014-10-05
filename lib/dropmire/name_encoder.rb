require 'yaml'

module Dropmire
  module NameEncoder

    class << self
      # :first and :middle are the first and middle names to encode.
      def encode(first, middle)
        raise "Cannot encode nil name" if first.nil? || middle.nil?

        fcode = generate_fcode(first.downcase)
        mcode = find(:middle_initials, initial(middle).upcase)

        "%3d" % (fcode + mcode)
      end

      def generate_fcode(name)
        val = find(:first_names, name.downcase)

        if val.nil?
          val = find(:first_initials, initial(name).upcase)
        end

        val
      end

      # get the corresponding initial for a given :name.
      def initial(name)
        return nil if name.nil?
        name[0].downcase
      end

      def load(filename)
        load_yaml_from(filename)
      end

      def first_names
        @first_names ||= load_first_names
      end

      def first_initials
        @first_initials ||= load_first_initials
      end

      def middle_initials
        @middle_initials ||= load_middle_initials
      end

      # searches the desired Hash (chosen by :method) for the :key
      def find(method, key)
        if allowed_find_methods.include? method
          self.send(method).fetch(key, nil)
        else
          raise "Illegal find method!"
        end
      end

      private

        def allowed_find_methods
          [ :first_names, :first_initials, :middle_initials ]
        end

        def load_first_names
          @first_names = load(first_name_yaml)
        end

        def load_first_initials
          @first_initials = load(first_initial_yaml)
        end

        def load_middle_initials
          @middle_initials = load(middle_initial_yaml)
        end

        def load_yaml_from(filename)
          parsed = begin
            YAML.load(File.open(filename))
          rescue ArgumentError => e
            puts "Could not parse YAML: #{e.message}"
          end
        end

        # YAML file name helpers #

        def yaml_dir
          'config/'
        end

        def first_name_yaml
          yaml_dir + 'first_name.yml'
        end

        def first_initial_yaml
          yaml_dir + 'first_initial.yml'
        end

        def middle_initial_yaml
          yaml_dir + 'middle_initial.yml'
        end
    end

  end
end
