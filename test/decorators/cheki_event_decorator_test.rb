# coding: utf-8
require 'test_helper'

class ChekiEventDecoratorTest < ActiveSupport::TestCase
  def setup
    @cheki_event = ChekiEvent.new.extend ChekiEventDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
