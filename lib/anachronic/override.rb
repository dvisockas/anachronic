# frozen_string_literal: true

module Anachronic::Override
  def async(method_name)
    new_name = "anachronic__#{method_name}".to_sym
    alias_method new_name, method_name

    undef_method method_name

    define_method(method_name) do |*args|
      Anachronic::BackgroundExecutor.call(self, new_name, *args)
    end
  end
end
