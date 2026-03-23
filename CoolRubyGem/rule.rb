# frozen_string_literal: true
class Rule
  def initialize(rule)
    @is_end = rule.match?(/->\./)
    rule = rule.gsub('.', '') if @is_end
    rule = rule.split('->')
    @x = rule[0]
    @y = rule[1]

  end

  def to_s
    "#{@x}->#{@is_end ? '.' : ''}#{@y}"
  end

  def is_end?
    @is_end
  end

  def can_be_used?(word)
    word.match?(@x)
  end

  def result(word)
    while can_be_used?(word)
      word = word.sub(/#{@x}/, @y)
      break if is_end?
    end
    word
  end

end