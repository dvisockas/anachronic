# frozen_string_literal: true

require "async/methods/version"
require "async/methods/background_executor"
require "async/methods/error"

module Async
  module Methods
    def async(method_name)
      new_name = "async__#{method_name}".to_sym
      alias_method new_name, method_name

      define_method(method_name) do |*args|
        BackgroundExecutor.call(self, new_name, *args)
      end
    end
  end
end
