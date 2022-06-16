# check-bundler-versions

A Ruby script to check the Bundler versions in Gemfile.lock files

## Why created

In their 2022 [RailsConf](https://railsconf.org) talk 'Gem install: What could go wrong?'  by [Ashley Ellis Pierce](https://twitter.com/aellispierce) & [Betty Li](https://twitter.com/bettymakes/) advised us about steps that make using Ruby gems safer. One such step is to at least use Bundler 2.222.

## What the script does

This script takes a directory name, and looks into the `Gemfile.lock` files inside it (recursively), and lists the version they were bundled with.

## What it DOES NOT do

The script does not attempt to update the lock files for the `Gemfile`s.

## How to use it

Call from the command line and pass the folder where the Git repositories for your Ruby projects are (that use Bundler):

```
 > ./check_bundler_versions.rb ../
 .
 .
 .
../daystillagiletd/Gemfile.lock: -> Bundler version: 2.3.15
…
../<rather_outdated_project>/Gemfile.lock: -> Bundler version: 1.10.6
…
../<no_bundler_version_set_in_this_project>/Gemfile.lock: -> Bundler version: NONE???
.
.
.
```

Depending on the number for repositories the script may take some time.
