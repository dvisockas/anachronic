# frozen_string_literal: true

require_relative './error.rb'

module Anachronic
  class BackgroundExecutor
    class << self
      def call(instance, method, *args)
        no_executor unless executor

        executor.call(instance, method, *args)
      end

      private

      def executor
        @executor ||= begin
          return Executors::ApplicationJob if defined?(ApplicationJob)
          return Executors::ApplicationJob if defined?(Sidekiq)
          return Executors::Resque if defined?(Resque)
        end
      end

      def no_executor
        raise Anachronic::Error('No background executor defined, async methods will be executed synchronously')
      end
    end
  end
end
