# frozen_string_literal: true

require "anachronic/version"
require "anachronic/background_executor"
require "anachronic/error"

module Anachronic
  def async(method_name)
    new_name = "anachronic__#{method_name}".to_sym
    alias_method new_name, method_name

    define_method(method_name) do |*args|
      BackgroundExecutor.call(self, new_name, *args)
    end
  end
end
