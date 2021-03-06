# frozen_string_literal: true

module Anachronic
  module Executors
    # Default executor for ApplicationJob backend
    class ApplicationJob
      class << self
        def call(instance, method, *args)
          executor.perform_later(instance, method, *args)
        end

        def executor
          @executor ||= begin
            return unless defined? Applicationjob

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
