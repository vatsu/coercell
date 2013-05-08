# Coercell [![Code Climate](https://codeclimate.com/github/jzup/coercell.png)](https://codeclimate.com/github/jzup/coercell) [![Build Status](https://travis-ci.org/jzup/coercell.png)](https://travis-ci.org/jzup/coercell])

A spreadsheet parser and importer to ActiveRecord models

## Installation

Add this line to your application's Gemfile:

    gem 'coercell'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coercell

## Usage

    parser = Coercell::Parser.new(YourModel)
    parser.spreadsheet = "path/to/spreadsheet.xls"

    parser.parse!

    errors = parser.errors
    valid = parser.valid

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
