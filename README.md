# DriversLicense

A composed_of implementation of a driver's license for use in Rails projects.


## Installation

Add this line to your application's Gemfile:

    gem 'drivers_license'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install drivers_license


## Usage

Assuming a table people has attribute 'drivers_license\_state', 'drivers_license\_number' and 
'drivers_license_expires_on'.

    class Person

      drivers_license :drivers_license

    end

Now you can use #drivers_license:

    person = Person.new

    person.drivers_license.class.name # => DriversLicense::License

    person.drivers_license_state      # => 'TX'
    person.drivers_license.state      # => 'TX'

    person.drivers_license_number     # => '123456789'
    person.drivers_license.number     # => '123456789'

    person.drivers_license_expires_on # => '2014-01-01'
    person.drivers_license.number     # => '2014-01-01'

    person.drivers_license.to_s       # => 'TX123456789'

