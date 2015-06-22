require 'calabash-cucumber/wait_helpers'
require 'calabash-cucumber/operations'
require_relative '../../../../../lib/puppis'

Puppis::Config.platform = :ios
Puppis.log.level = Logger::DEBUG
World(Calabash::Cucumber::Operations)
