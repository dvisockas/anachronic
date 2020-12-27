# frozen_string_literal: true

module Anachronic
  # Takes over a method and renames original method for later use
  module Override
    def async(method_name)
      new_name = "anachronic__#{method_name}".to_sym
      alias_method new_name, method_name

      undef_method method_name

      define_method(method_name) do |*args|
        BackgroundExecutor.call(self, new_name, *args)
      end
    end
  end
end
