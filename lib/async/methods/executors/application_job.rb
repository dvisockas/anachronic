# frozen_string_literal: true

module Async
  module Methods
    module Executors
      class ApplicationJob
        def self.call(instance, method, *args)
          default_executor.perform_later(instance, method, *args)
        end

        def self.default_executor
          @@default_executor ||= begin
            Class.new(ApplicationJob) do
              def perform_later(instance, method, *args)
                instance.send(method, *args)
              end
            end
          end
        end
      end
    end
  end
end