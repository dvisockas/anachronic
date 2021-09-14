# frozen_string_literal: true

class Anachronic::Executors::Sidekiq
  class << self
    def call(instance, method, *args)
      executor.perform_async(instance, method, *args)
    end

    def executor
      @executor ||= begin
        Class.new(self) do
          include ::Sidekiq::Worker

          def perform_async(instance, method, *args)
            instance.public_send(method, *args)
          end
        end
      end
    end
  end
end
