require 'calabash-cucumber/wait_helpers'
require 'calabash-cucumber/operations'
require_relative '../../../../../lib/puppis'

Puppis::Config.platform = :ios
World(Calabash::Cucumber::Operations)
