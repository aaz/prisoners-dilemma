# Getting Up and Running #

This should be fairly straightforward, even if you're starting from square one.

## _Install ..._ ##
### Ruby ###
The code was developed using Ruby 1.9, so I recommend installing that version.  Ruby Version Manager (rvm) enables you to manage multiple versions of the Ruby platform on one machine, and to switch easily between them.  It works for me ...
### `bundler` ###
Use gem, Ruby's package manager, to install the bundler gem:

    gem install bundler
### Code ###
If you haven't already done so, now's the time to clone this repository.
### Dependencies ###
You should notice a Gemfile.lock file in the root directory of the project.  This specifies project dependencies, and is used by the bundle command line utility included in the bundler gem.  From the project root directory, type the following:

    bundle install
## _Run_ ##
From the project root directory, type the following:

    autotest

This will execute the suite of specs for the project.