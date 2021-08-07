class Operation
	def Addition
		puts "Enter A and B Values"
		a = gets.chomp.to_i(); 
		b = gets.chomp.to_i();
		#a =gets.chomp
		#b = gets.chomp
		puts "***********************************"
		puts a
		puts b
		puts a+b 


     end

     def Substraction
     	puts "Enter A and B Values"
		a = gets.chomp.to_i(); 
		b = gets.chomp.to_i();
		#a =gets.chomp
		#b = gets.chomp
		puts "***********************************"
		puts a
		puts b
		puts a-b 

     end
end

obj = Operation.new()
obj.Addition
obj.Substraction