# coding: utf-8
require 'test_helper'

class TagDecoratorTest < ActiveSupport::TestCase
  def setup
    @tag = Tag.new.extend TagDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
