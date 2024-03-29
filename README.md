<div align="center">
  <a href="https://ttytoolkit.org"><img width="130" src="https://github.com/piotrmurach/tty/raw/master/images/tty.png" alt="TTY Toolkit logo"/></a>
</div>

# TTY::Which [![Gitter](https://badges.gitter.im/Join%20Chat.svg)][gitter]

[![Gem Version](https://badge.fury.io/rb/tty-which.svg)][gem]
[![Actions CI](https://github.com/piotrmurach/tty-which/workflows/CI/badge.svg?branch=master)][gh_actions_ci]
[![Build status](https://ci.appveyor.com/api/projects/status/2rpm67huf1nh98d0?svg=true)][appveyor]
[![Code Climate](https://codeclimate.com/github/piotrmurach/tty-which/badges/gpa.svg)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/tty-which/badge.svg?branch=master)][coveralls]
[![Inline docs](https://inch-ci.org/github/piotrmurach/tty-which.svg?branch=master)][inchpages]

[gitter]: https://gitter.im/piotrmurach/tty
[gem]: https://badge.fury.io/rb/tty-which
[gh_actions_ci]: https://github.com/piotrmurach/tty-which/actions?query=workflow%3ACI
[appveyor]: https://ci.appveyor.com/project/piotrmurach/tty-which
[codeclimate]: https://codeclimate.com/github/piotrmurach/tty-which
[coveralls]: https://coveralls.io/github/piotrmurach/tty-which
[inchpages]: https://inch-ci.org/github/piotrmurach/tty-which

> Platform independent implementation of Unix `which` utility that searches for executable file in the path variable.

**TTY::Which** provides cross-platform executables search component for [TTY](https://github.com/piotrmurach/tty) toolkit.

## Installation

Add this line to your application's Gemfile:

    gem "tty-which"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tty-which

## Usage

**TTY::Which** has `which` method that searches set of directories for an executable file based on the `PATH` environment variable.

When the path to an executable program exists, an absolute path is returned, otherwise `nil`.

For example, to find location for an executable program do:

```ruby
TTY::Which.which("less")  # => "/usr/bin/less"
TTY::Which.which("git")   # => "C:\Program Files\Git\bin\git"
```

You can also check an absolute path to executable:

```ruby
TTY::Which.which("/usr/bin/ruby")  # => "/usr/bin/ruby"
```

You can also specify directly the paths to search using `:paths` keyword:

```ruby
TTY::Which.which("ruby", paths: ["/usr/local/bin", "/usr/bin", "/bin"])
# => "/usr/local/bin/ruby"
```

When you're only interesting in knowing that an executable exists on the system use the `exist?` call:

```ruby
TTY::Which.exist?("ruby") # => true
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/piotrmurach/tty-which. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork it ( https://github.com/piotrmurach/tty-which/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright

Copyright (c) 2015 Piotr Murach. See LICENSE for further details.
