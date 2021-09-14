# frozen_string_literal: true

class Anachronic::Executors::ApplicationJob
  class << self
    def call(instance, method, *args)
      executor.perform_later(instance, method, *args)
    end

    def executor
      @executor ||= begin
        return unless defined? ::Applicationjob

        Class.new(self) do
          def perform_later(instance, method, *args)
            instance.public_send(method, *args)
          end
        end
      end
    end
  end
end
