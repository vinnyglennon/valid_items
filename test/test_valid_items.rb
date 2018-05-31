require 'minitest/autorun'
require 'valid_items'

class ValidItemsTest < Minitest::Test
  def test_it_runs
    assert_equal 'ok', ValidItems.checkup
  end
end
