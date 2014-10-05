# Dropmire

Dropmire is a gem for collecting data from scanning a government issued Driver's License, and building a useful Ruby object based on the correct state.

## Installation

Add this line to your application's Gemfile:

    gem 'dropmire'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dropmire

## Usage

Install the gem:

```bash
gem install dropmire
```

Or add to Gemfile:

```bash
gem 'dropmire'
```

Do cool stuff

```ruby
person = Dropmire::Identity.new("""Your scanned input here!""")

# use your super cool new object
person.first_name
# => 'John'

person.middle_name
# => 'Pearce'

person.last_name
# => 'Doe'

person.date_of_birth
# => '1993-06-07'

person.drivers_license_number
# => 'D21242193207'

person.drivers_license_expiration_date
# => '2015-06'

person.street
# => '1234 Main St'

person.city
# => 'Tallahassee'

person.state
# => 'State'

person.zipcode
# => '12345'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dropmire/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
