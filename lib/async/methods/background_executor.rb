# frozen_string_literal: true

require 'singleton'
require 'logger'

module Async
  module Methods
    class BackgroundExecutor
      include Singleton

      class << self
        def call(instance, method, *args)
          no_executor if executor.blank?

          executor.call(instance, method, *args)
        end

        private

        def executor
          return Executors::ApplicationJob if defined?(ApplicationJob)
          return Executors::ApplicationJob if defined?(Sidekiq)
          Executors::Resque if defined?(Resque)
        end

        def no_executor
          raise Error('No background executor defined, async methods will be executed synchronously')
        end
      end
    end
  end
end