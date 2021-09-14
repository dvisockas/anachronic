# frozen_string_literal: true

require 'anachronic/version'
require 'anachronic/background_executor'
require 'anachronic/error'
require 'anachronic/override'
require 'anachronic/configuration'

module Anachronic
  include Anachronic::Override
  include Anachronic::Configuration
end
