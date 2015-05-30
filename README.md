# TTY::Which
[![Gem Version](https://badge.fury.io/rb/tty-which.svg)][gem]
[![Build Status](https://secure.travis-ci.org/peter-murach/tty-which.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/peter-murach/tty-which/badges/gpa.svg)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/peter-murach/tty-which/badge.svg?branch=master)][coveralls]
[![Inline docs](http://inch-ci.org/github/peter-murach/tty-which.svg?branch=master)][inchpages]

[gem]: http://badge.fury.io/rb/tty-which
[travis]: http://travis-ci.org/peter-murach/tty-which
[codeclimate]: https://codeclimate.com/github/peter-murach/tty-which
[coveralls]: https://coveralls.io/r/peter-murach/tty-which
[inchpages]: http://inch-ci.org/github/peter-murach/tty-which

> Platform independent implementation of Unix `which` utility that searches for executable file in the path.

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
