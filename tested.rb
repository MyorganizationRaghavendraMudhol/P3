class Demo
	def my_fun1
		puts "hello"
	end
	def self.my_fun2
		puts "class method"
	end
end

Demo1 = Demo.new
Demo1.my_fun1
Demo.my_fun2