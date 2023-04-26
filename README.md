# Ruby Superparser

Ruby Superparser is a gem that simplifies making HTTP requests to the SuperParser API for parsing resume documents.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-superparser', git: 'https://github.com/jpsilvashy/ruby-superparser.git'
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install ruby-superparser
```

## Usage

1. Set the `SUPERPARSER_API_KEY` environment variable with your SuperParser API key:

```sh
export SUPERPARSER_API_KEY=your_api_key_here
```

### In a Rails application

To use this gem in a Rails application, run the generator to create an initializer:

```sh
rails generate superparser:install
```

This will create a `config/initializers/superparser.rb` file, which initializes the `SUPERPARSER_CLIENT` constant.

Now you can use the gem throughout your Rails application:

```ruby
json_result = SUPERPARSER_CLIENT.parse_resume('path/to/your/resume.pdf')
puts json_result
```

### In other Ruby applications

In other Ruby applications, create a `Client` instance and use it to parse resumes:

```ruby
require 'superparser'

api_key = ENV['SUPERPARSER_API_KEY']
client = Superparser::Client.new(api_key)
json_result = client.parse('path/to/your/resume.pdf')
puts json_result
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpsilvashy/ruby-superparser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jpsilvashy/ruby-superparser/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

