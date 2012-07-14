# Getting Up and Running #

This should be fairly straightforward, even if you're starting from square one.

## _Install ..._ ##
### Ruby ###
The code was developed using Ruby 1.9, so I recommend installing that version.  Ruby Version Manager (rvm) enables you to manage multiple versions of the Ruby platform on one machine, and to switch easily between them.  It works for me ...
### bundler ###
Use gem, Ruby's package manager, to install the bundler gem:

    gem install bundler
### Code ###
If you haven't already done so, now's the time to clone this repository.
### Dependencies ###
You should notice a Gemfile.lock file in the root directory of the project.  This specifies project dependencies, and is used by the bundle command line utility included in the bundler gem.  From the project root directory, type the following:

    bundle install
## _Run_ ##
### specs ###
To execute the suite of specs, type the following from the project root directory:

    rspec

Alternatively, you can type:

    autotest

This will start the autotest process.  Autotest executes the specs on launch, and subsequently whenever project files are modified.  It can also be configured to use growl style notifications (either in OS/X or Windows) to notify you when you're making changes using your IDE or text editor. 
### Tournament ###
To run a tournament, type the following:

    rake -I. filename=tournament.yaml

Which will execute the default rake task using the configuration given in the sample YAML file. 
