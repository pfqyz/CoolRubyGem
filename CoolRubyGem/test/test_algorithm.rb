# frozen_string_literal: true
require 'minitest/autorun'

require_relative '../lib/CoolRubyGem/rule'
require_relative '../lib/CoolRubyGem/system'

include CoolRubyGem
class TestRule < Minitest::Test

  def test_rule_creation
    rule = Rule.new('x->yy')
    assert_equal 'x->yy', rule.to_s
    assert_equal false, rule.is_end?
  end

  def test_rule_creation_end
    rule = Rule.new('x->.y')
    assert_equal 'x->.y', rule.to_s
    assert_equal true, rule.is_end?
  end

  #1 применение правила
  def test_rule_application
    rule = Rule.new('x->yy')
    result = rule.apply('xxyy')
    assert_equal 'yyxyy', result
  end

  def test_terminal_rule_application
    rule = Rule.new('x->.yy')
    result = rule.apply('xxyy')
    assert_equal 'yyxyy', result
  end

  def test_e_rule
    rule = Rule.new('e->.y')
    result = rule.apply('xx')
    assert_equal 'yxx', result
  end

  def test_can_be_used
    rule = Rule.new('x->yy')
    assert_equal true, rule.can_be_used?('xxyy')
    assert_equal false, rule.can_be_used?('yyyy')
  end

end

class TestRule < Minitest::Test

  def test_system_creation
    system = System.new(['x->y', 'y->x'])
    assert_equal '{ x->y; y->x; }', system.to_s
  end

  def test_system_application
    system = System.new(['y->x', 'x->.yy'])
    result = system.result('xxyy')
    assert_equal 'yyxxx', result
  end

  def test_system_without_end_rule
    system = System.new(['x->yy','x->y'])
    result = system.result('xxyy')
    assert_equal 'yyyyyy', result
  end

  def test_system_with_e_rule
    system = System.new(['x->y', 'e->y', 'x->.yy'])
    result = system.result('xxyy')
    assert_equal 'Looping has happened', result
  end

  def test_system_with_e_rule
    system = System.new(['x->y', 'e->.y', 'x->.yy'])
    result = system.result('xxyy')
    assert_equal 'yyyyy', result
  end

  def test_system_with_empty_word
    system = System.new(['x->y', 'e->.y', 'x->.yy'])
    result = system.result('')
    assert_equal 'y', result
  end

  def test_system_adding_rule
    system = System.new([])
    system << Rule.new('x->y')
    assert_equal '{ x->y; }', system.to_s
  end
end