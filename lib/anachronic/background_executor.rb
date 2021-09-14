# frozen_string_literal: true

require 'anachronic/error'
require 'anachronic/executors'

class Anachronic::BackgroundExecutor
  class << self
    def call(instance, method, *args)
      no_executor unless executor

      executor.call(instance, method, *args)
    end

    private

    def executor
      @executor ||= begin
        return Anachronic::Executors::Sidekiq if defined?('Sidekiq')
        return Anachronic::Executors::ApplicationJob if defined?('ApplicationJob')
        return Anachronic::Executors::Resque if defined?('Resque')
      end
    end

    def default_or_defined?(name)
      defined?(name.constantize) || config.default_executor.name == name
    end

    def no_executor
      raise Error('No background executor found')
    end
  end
end
