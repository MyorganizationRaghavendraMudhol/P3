a = proc { |x| puts "hello #{x}" }
puts a.call(3, 4)

l = -> { puts 'This is a lambda' }
puts l.call
