#!/usr/bin/env bash

set -e

# you need you `bundle exec CMD` to use my gem fork... or gem install it

bundle exec kitchen converge
