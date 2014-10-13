#### ThoughtWorks LevelUp Presents

# Zombie

Repository for Sydney Dawn of the Devs

[![Build Status](https://snap-ci.com/twlevelup/zombie/branch/master/build_image)](https://snap-ci.com/twlevelup/zombie/branch/master)

## Setup

_note: any commands run on the command line are prefixed with `$ ` - you won't
need to include the `$ ` when running the command_

### Prerequisites

1. [VirtualBox](https://www.virtualbox.org/)
2. [vagrant](https://www.vagrantup.com/)

### Git setup

- For Windows - [Github client](http://windows.github.com/)
- For Mac OS X - [Github client](http://mac.github.com/) or [Homebrew](http://brew.sh/) + `$ brew install git`
- Roll it yourself - [Official git packages](http://git-scm.com/downloads)

### Run the Build

1. `$ vagrant up`
2. `$ vagrant ssh`
3. `$ cd /vagrant`
4. `$ bundle exec rake`

### Handy Commands

* `$ bundle rake -T`

### Guard

Simply run `guard` from within a terminal and it will watch the lib/ and spec/ directories. On file changes (aka save) it will run the respective tests for the file that was changed. This guarantees instant feedback. Now go forth and write tests.
