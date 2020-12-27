# frozen_string_literal: true

module Anachronic
  module Executors
    # Default executor for ApplicationJob backend
    class ApplicationJob
      class << self
        def call(instance, method, *args)
          default_executor.perform_later(instance, method, *args)
        end

        def default_executor
          @default_executor ||= begin
            Class.new(ApplicationJob) do
              def perform_later(instance, method, *args)
                instance.public_send(method, *args)
              end
            end
          end
        end
      end
    end
  end
end
