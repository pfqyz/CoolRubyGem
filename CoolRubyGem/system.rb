# frozen_string_literal: true
require_relative 'rule.rb'
class System
  include Enumerable
  def initialize(rules)
    @rules = []
    rules.each do |r|
      @rules.append(Rule.new(r))
    end
  end

  def <<(val)
    @rules << val
  end

  def each(&block)
    @rules.each(&block)
  end

  def to_s
    str = '{ '
    @rules.each do |r|
      str += "#{r.to_s}; "
    end
    str + '}'
  end

  def result(word)
    w = word.dup
    changed = true

    while changed

      changed = false

      @rules.each do |r|
        while r.can_be_used?(w)
          w = r.result(w)
          changed = true

          return w if r.is_end?
        end
      end
    end
    w
  end

end
