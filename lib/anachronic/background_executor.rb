# frozen_string_literal: true

require_relative './error.rb'

module Anachronic
  # Class for deciding a background execution backend
  class BackgroundExecutor
    class << self
      def call(instance, method, *args)
        no_executor unless executor

        executor.call(instance, method, *args)
      end

      private

      def executor
        @executor ||= begin
          return Executors::ApplicationJob if default_or_defined?(ApplicationJob)
          return Executors::Sidekiq if default_or_defined?(Sidekiq)
          return Executors::Resque if default_or_defined?(Resque)
        end
      end

      def default_or_defined?(name)
        defined?(name) || config.default_executor == name
      end

      def no_executor
        raise Anachronic::Error('No background executor found')
      end
    end
  end
end
