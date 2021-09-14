# frozen_string_literal: true

class Anachronic::Executors::Resque
  class << self
    def call(instance, method, *args)
      executor.perform(instance, method, *args)
    end

    def executor
      @executor ||= begin
        return unless defined? ::Resque

        Class.new(self) do
          def self.perform(instance, method, *args)
            instance.public_send(method, *args)
          end
        end
      end
    end
  end
end
