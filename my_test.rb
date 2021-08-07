========
   Meta -Programming
class A
  def my_fun
    puts "hi"
  end
end

class Person < A
  def my_fun
    puts "hello"
  end
end
#Person.new.my_fun
class Person
  #remove_method :my_fun
  undef_method :my_fun
end
Person.new.my_fun

class Rubyist
  def method_missing(m, *args, &block)
    puts "Called #{m} with #{args.inspect} and #{block}"
  end
end
Rubyist.new.anything
Rubyist.new.anything(3, 4) { something } #

class Person
  def testing(x,y)
    @x = x
    @y = y
    [@x , @y]
  end
  def my_fun
    puts "hello"
  end
end

obj = Person.new
if obj.respond_to?(:testing)
  puts "yes"
else
  puts "no response"
end
obj.my_fun
remove_method:my_fun

class Person
  def testing(x,y)
    @x = x
    @y = y
    [@x , @y]
end
end
ref = Person.new
puts ref.class
puts ref.instance_of?(Person)
puts ref.class.instance_methods
puts (ref.send(:testing,10,20))


class Person
  def  self.my_fun1
    puts " hello"
  end
 def my_fun(x)
  @name = "hello"
    puts x

  end
  def testing
  end
end
ref = Person.new
ref.my_fun("hello")
puts ref.class.instance_methods

class Rubyist
  # the code in the following method definition is executed later,
  # when you eventually call the method
  def what_does_he_do
    @person = 'A Rubyist'
    'Ruby programming'
  end
end
an_object = Rubyist.new
puts an_object.class # => Rubyist
puts an_object.class.instance_methods(false) # => what_does_he_do
an_object.what_does_he_do
puts an_object.instance_variables # => @person

obj = Object.new
if obj.respond_to?(:program)
  obj.program
else
  puts "Sorry, the object doesn't understand the 'program' message."
end
=end
