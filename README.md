# TTY::Which

> Platform independent implementation of Unix `which` command that searches executables in the path.

## Installation

Add this line to your application's Gemfile:

    gem 'tty-which'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-which

## Usage

**TTY::Which** exposes `which` method that searches the path for executable file that would be run had the command been invoked.

For example, to find location for a single command do:

```ruby
TTY::Which.which('less')  # => '/usr/bin/less'
TTY::Which.which('git')   # => 'C:\Program Files\Git\bin\git'
```

You can also check an absolute path:

```ruby
TTY::Which.which('/usr/bin/ruby')  # => '/usr/bin/ruby'
```

## Contributing

1. Fork it ( https://github.com/peter-murach/tty-which/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Piotr Murach. See LICENSE for further details.
