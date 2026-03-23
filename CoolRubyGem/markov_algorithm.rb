# frozen_string_literal: true
# Скажем, что систему уравнений мы будем обозначать так
# {
# ...
# }
# каждое правило из системы будет иметь вид:
# x -> y; или x ->. y;
# файл будет иметь вид:
# система:{}
# а затем слова для преобразования пример: aaa bbb ababa babab aabbaabbaabb
# пока не встретиться другая система мы будем обрабатывать эти слова по прошлой системе
# если она<другая система> встретилась, то считываем ее и обрабатываем следующие за ней слова
# каждое правило вида x -> y; или x ->. y; будет иметь такой и только такой вид
# (\n после каждого правила не обязателен, но желателен).
# ///////////////////////////////////////////////////
# договоримся, что в славах не может быть символа e,
# так как он нам понадобился для реализации пустого элемента в функциях
# в случае его использования будет выброшено исключение

require_relative 'rule.rb'
require_relative 'system.rb'
require_relative 'parse.rb'

r = Rule.new('x->yy')
w = 'xxyy'
puts "Word: #{w}"
puts "Rule: #{r}"
puts "Result: #{r.step_by_step_solution(w)}"
puts "//////////////"
r = Rule.new('e->.yy')
puts "Word: #{w}"
puts "Rule: #{r}"
puts "Result: #{r.step_by_step_solution(w)}"
puts "//////////////"
r = Rule.new('e->yy')
puts "Word: #{w}"
puts "Rule: #{r}"
puts "Result: #{r.step_by_step_solution(w)}"
puts "//////////////"

r = Rule.new('e->yy')
#w1 = 'yyex' для проверки выбрасывания исключения
puts "Word: #{w}"
puts "Rule: #{r}"
puts "Result: #{r.step_by_step_solution(w)}"
puts "//////////////"

s = System.new(['y->x','x->.yy'])
puts "System: #{s}"
puts "Word: #{w}"
puts "Result: #{s.step_by_step_solution(w)}"
puts "//////////////"
s = System.new(['x->y','y->.x','x->.yy'])
puts "System: #{s}"
puts "Word: #{w}"
puts "Result: #{s.step_by_step_solution(w)}"
puts "//////////////"
s = System.new(['x->y','e->y','x->.yy'])
puts "System: #{s}"
puts "Word: #{w}"
puts "Result: #{s.step_by_step_solution(w)}"
puts "//////////////"
s = System.new(['x->y','y->e','x->.yy'])
puts "System: #{s}"
puts "Word: #{w}"
puts "Result: #{s.step_by_step_solution(w)}"
puts "//////////////"
puts "//////////////"
system = System.new(['x->y', 'x->.yy'])
puts system.step_by_step_solution('xxyy')


#s1 = System.new(['x->.y','e->y','x->.yy']) - проверка на правильность слова

puts
puts
puts "//////Parsing file part////////"
names_f =["BadFile.txt", "GoodFile.txt", "ErrorFile.txt"]
names_f.each do |name|
  puts "//////Parsing and test '#{name}' file////////"
  rules_arrays, strings_arrays = parsing(name)

  rules_arrays.each_with_index do |rules, idx|
    puts "Система #{idx + 1}: { #{rules.join('; ')} }"

    system = System.new(rules)

    strings_arrays[idx].each do |word|
      result = system.result(word)
      puts "  #{word} -> #{result}"
    end

    puts
  end

rescue => e
  puts "Ошибка: #{e.message}"

end

