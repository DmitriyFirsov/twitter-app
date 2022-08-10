# frozen_string_literal: true

class BaseQueryParamsValidator
  include ActiveModel::Validations

  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def read_attribute_for_validation(key)
    data[key]
  end
end
