# frozen_string_literal: true

module Anachronic
  module Executors
    # Default executor for Sidekiq backend
    class Sidekiq
      class << self
        def call(instance, method, *args)
          executor.perform_async(instance, method, *args)
        end

        def executor
          @executor ||= begin
            Class.new(Sidekiq) do
              include ::Sidekiq::Worker

              def perform_async(instance, method, *args)
                instance.public_send(method, *args)
              end
            end
          end
        end
      end
    end
  end
end
