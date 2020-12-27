# frozen_string_literal: true

require 'ostruct'

module Anachronic
  module Configuration
    def self.configure
      @config ||= OpenStruct.new
      yield(@config) if block_given?
      @config
    end

    def self.config
      @config || configure
    end
  end
end
