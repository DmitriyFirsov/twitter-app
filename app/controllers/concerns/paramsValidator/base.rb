# frozen_string_literal: true

module ParamsValidator
  class Base
    include ActiveModel::Validations

    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def read_attribute_for_validation(key)
      @params.dig(*key.to_s.split("."))
    end
  end
end
