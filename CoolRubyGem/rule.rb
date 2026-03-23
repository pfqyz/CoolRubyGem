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
    return true if @x == 'e'
    word.match?(@x)
  end

  def result(word)

    raise "The e symbol appears in the word! Error! Incorrect alphabet!" if word.include?('e')

    while can_be_used?(word)
      s = word
      if @x == 'e' && @y == 'e'
        return "Looping has happened" unless is_end?
      elsif @x == 'e'
        word = @y + word
        return "Looping has happened" unless is_end?
      elsif @y == 'e'
        word = word.sub(/#{@x}/, '')
      else
        word = word.sub(/#{@x}/, @y)
      end
      s = s + '->' + word
      puts s
      break if is_end?
    end
    word
  end

end