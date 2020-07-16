require "async/methods/version"

module Async
  module Methods
    class Error < StandardError; end

     def async(method_name)
      new_name = "async__#{method_name}".to_sym
      alias_method new_name, method_name
      remove_method method_name

      define_method(method_name) do |*args|
        background_executor.perform_later(self, new_name, *args)
      end
    end
  end
end
