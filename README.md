# Guard::WEBrick

[![travis-ci](http://travis-ci.org/fnichol/guard-webrick.png)](http://travis-ci.org/fnichol/guard-webrick)

Guard::WEBrick automatically starts and restarts WEBrick when needed. Useful when you are working on a static site but want to benefit from [Guard::LiveReload](http://github.com/guard/guard-livereload).

* Tested on Ruby 1.8.7, 1.9.2, Ruby Enterprise Edition, and JRuby

## Install

Please be sure to have [Guard](http://github.com/guard/guard) installed before continue.

Install the gem:

    gem install guard-webrick

Add it to your Gemfile (inside test group):

    gem 'guard-webrick'

Add guard definition to your Guardfile by running this command:

    guard init webrick

## Usage

Please read [Guard usage doc](http://github.com/guard/guard#readme)

## Guardfile

You can adapt your 'view' files like you want.
Please read [Guard doc](http://github.com/guard/guard#readme) for more info about Guardfile DSL.

    guard 'webrick' do
    end

## Options

The WEBrick guard has 3 options that you can set like this:

    guard 'webrick', :host => '127.0.0.1', :port => '35728', :docroot => 'public' do
      ...
    end

Available options:

    :host => '127.3.3.1'     # default '0.0.0.0'
    :port => '12345'         # default '3000'
    :docroot => 'public'     # default current working directory
    :launchy => false        # default true

## Development

* Source hosted at [GitHub](http://github.com/fnichol/guard-webrick)
* Report issues/Questions/Feature requests on [GitHub Issues](http://github.com/fnichol/guard-webrick/issues)

Pull requests are very welcome! Make sure your patches are well tested. Please create a topic branch for every separate change
you make.

== Authors

[Fletcher Nichol](http://github.com/fnichol)
