# frozen_string_literal: true
require 'minitest/autorun'

require 'fileutils'

require_relative '../lib/CoolRubyGem/parse'

include CoolRubyGem
class ParseFileTest < Minitest::Test
  def test_good_file
    rules, strings = parsing('test/fixtures/GoodFile.txt')
    expected_rules = [
      ["ab->a", "b->e", "a->b"],
      ["ab->a", "b->.e", "a->b"],
      ["ba->a", "bb->b", "ab->e", "e->.b"]
    ]
    expected_strings = [
      ["bbaab", "aabbbaa"],
      ["bbaab", "aabbbaa"],
      ["bbaab", "aaaa", "bbbbb"]
    ]
    assert_equal expected_rules, rules
    assert_equal expected_strings, strings
  end

  def test_bad_file_with_spaces
    rules, strings = parsing('test/fixtures/BadFile.txt')
    expected_rules = [
      ["ab->a", "b->e", "a->b"],
      ["ab->a", "b->.e", "a->b"],
      ["ba->a", "bb->b", "ab->e", "e->.b"]
    ]
    expected_strings = [
      ["bbaab", "aabbbaa"],
      ["bbaab", "aabbbaa"],
      ["bbaab", "aaaa", "bbbbb"]
    ]
    assert_equal expected_rules, rules
    assert_equal expected_strings, strings
  end

  def test_error_file
    error = assert_raises(RuntimeError) { parsing('test/fixtures/ErrorFile.txt') }
    assert_match(/Invalid line format/, error.message)
  end
end
