
#require 'csv'
#A Line at a Time
=begin
CSV.foreach("/Users/rmudhol/Downloads/simple.csv") do |row|
    puts row
  end
  =end

#All at Once
=begin
# arr_of_arrs = CSV.read("/Users/rmudhol/Downloads/simple.csv")
table = CSV.parse(File.read('/Users/rmudhol/Downloads/simple.csv'), headers: true)


puts table

puts '------------'
puts table.by_row
puts '------------'
puts table.headers.find_index('name')
puts '============'
table = CSV.parse(File.read('/Users/rmudhol/Downloads/simple.csv'), headers: true)
puts table.by_col[table.headers.find_index('ID')]
=end


#def get_binding(x)
 #   binding
  #end
#b = get_binding("hello")

=begin
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
=begin
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

#Proc and lambda


=begin
conditional-statements
count = 100
case
when count == 1
  puts "#{count}"
when count == 2
  puts "#{count}"
when count == 100
  puts "#{count}"
  puts "this case conditional statements"
else
  puts "no"
end
=end
=begin
x = 10
loop do
  if x <= 1
    puts "#{x}"
    x=x-1
end
x=x-1
end

 (1..5).each  do |i|
  puts "#{i}"
end

for i in 0..5 do
  puts "hello"
end

Array_string = ["a","b","c"]
Array_string.each do |val|
  puts val
end


my_array = [3,5,2,1,9]
values = my_array.sort
puts values




puts "One string"
values=gets
puts values.chars
puts "Hi testing"


class Person
  #@age = 24
  def get_value
    yield
  #  puts "hello"
  end
  get_value{puts "hi"}


age_value = Person.new


##  @@age = 24
  #def get_value
  #  puts @@age
  #  yield

  def shivi

  # statement of the method to be executed
  puts "Inside Method!"

    # using yield statement
    # p1 is the parameter
    yield "p1"

  # statement of the method to be executed
  puts "Again Inside Method!"

  # using yield statement
  # p2 is the parameter
  yield "p2"

end

# block
shivi{ |para| puts "Inside Block #{para}"}


#end


#end
def my_fun
  yield 24
  yield 42
end
my_fun{|x| puts "hello: #{x}"}

puts "hello"





scores ={low:2,high:8,medium:3}
puts scores
puts scores[:low]


person = 10
person1 =10
puts person.object_id
puts  person1.object_id

h = {:aa=>1,"aa"=>2}
puts h["aa"]
#puts h.has_value?(1)


class A
  @@var = 10
  def my_fun
    puts "hello"
  end
end

class B < A
  puts @@var
end

Object_B = B.new



a = Hash.new
a = {"jan"=>1,"feb"=>2}
puts a
puts ["jan"]

def my_block_testing
  return "yes" if block_given?
  yield
end
my_block_testing{puts "this is block"}


my_lambda = -> {puts "hello lambda function"}
my_lambda.===
my_lambda.class


my_lambda = -> { return 1 }
puts "Lambda result: #{my_lambda.call}"

my_proc = Proc.new { return 1 }
puts "Proc result: #{my_proc.call}"



my_lambda = ->{ |x| puts x }
a.call(2)

lam = lambda{ |x| puts x}
lam.call(2)
lam.call(3)
puts lam.class
t = Proc.new { |x,y| puts "I don't care about arguments! #{x}"}
t.call(2)
t.class

lambda = -> (name) { puts "Hello #{name}" }
#lambda.call()

proc = Proc.new { |name| puts "Hello #{name}" }
proc.call()


class Person

  def my_fun
    puts "hello"
  end
end

class B < Person
  @@var = 10
end
pers = B.new
puts pers.var
pers.my_fun



module Get_value
  def get_name
    puts "Name"
  end
  def get_address
    puts "`Address`"
  end

end

#Get_values.get_name


class Person
  include Get_value

end


per = Person.new
per.get_name

#this is block with parameter
def my_fun(&block)
  #yield 1
  block.call(2)
end
my_fun{|x| puts  "#{x}"}

#this is lambda with parameter
lam = -> (x){puts "this is lambda func:#{x}"}
lam.call(2)
#this is Proc with parameter
p=Proc.new{|x| puts "this proc func"}
p.call(2)


def my_fun(x,y)
  begin
  res  = x / y
  puts res

rescue
   puts "value of Y should be 0"
  end
end
h = my_fun(2,0)
puts h
def my_fun(x,y)
  puts "value of x is :#{x} and value of y is :#{y}"
end

my_fun(10,20)

def my_fun1(x,y)
  begin
  res  = x / y
  puts res

rescue
   puts "value of Y should be 0"

 ensure
   "this block always executes"
 end
end
h = my_fun1(12,0)
puts h



def my_fun
   @x = 10
   p @x
end
def my_fun1
  puts @x
end

my_fun
my_fun1

p "Enter one string "
s = gets.chomp
print s

p "hello".reverse
p "hello".upcase
p "hello".downcase
p "hello".capitalize
s1 = "Raghavendra hello"

def my_fun1
  puts "hello"
end

x = my_fun1
px

def my_fun2
  return "helooo"
end

x = my_fun2
puts x




class Demo
  def setter
    @num_val = 10
  end

  def getter
    @num_val
  end
end

ref = Demo.new
ref.setter
puts ref.getter


class CSWebsite

  # Constructor to initialize
  # the class with a name
  # instance variable




  # Classical get method
  def website
      @website = "helo"
  end
end

# Creating an object of the class
gfg = CSWebsite.new
puts gfg.website




class Person
  def initialize(name)
    @name = name
  end
attr_accessor :name

end

ref = Person.new("hello")
puts ref.name
puts ref.name = "Raghavendra"


class Mobile
  attr_accessor :name,:price,:model_name

  def initialize(name:, price:, model_name:)
    @name = name
    @price = price
    @model_name = model_name
  end

  def display
    puts @name
    puts @price
    puts @model_name
  end

end

mob = Mobile.new(name: "sumsung" , price: 120000, model_name: "sums1223");
mob.display
mob = Mobile.new(name: 12345 , price: 120000, model_name: "sums1223")
mob.display

class Project
#  attributes :name ,:price
    attr_accessor :name , :price
#  attr_reader
#  attr_writer
#  attributes
  def initialize(name: ,price:)
    @name = name
    @price = price
  end

  def display
  return  @name ,@price

  end

end

pro = Project.new(name: "sumsung", price: 4500)
puts pro.display

def my_fun
  var = 10
  puts var
end
my_fun
def my_fun
 yield 1
end


def call_proc(my_proc)
  count = 500
  my_proc.call
end
count   = 1
my_proc = Proc.new { puts count }
p call_proc(my_proc)
my_fun do
  puts "hello"
end
lam =lambda {return 1}
puts "Lambda result: #{lam.call}"

puts "Lambda result: #{pp.call}"



begin

rescue Exception => e
  puts "Error occured:#{e}"
end
class A
  def my_fun
    x = 10
    puts x
  end
end

class B < A
  def my_fun
    super
    puts "helo"
end
end

 B.new.my_fun
#ref.my_fun
class Bank
  attr_accessor :name ,:type
  def initialize(name: ,type:)

    @name = name
    @type = type
  end
  def display
    return @name,@type
  end
end

ref = Bank.new(name: "SBI",type: "Saving")
ref.display

class Person
  def my_fun
    puts "hello"
  end
end

Person.new.my
class Person
  def my_fun
    puts "hello"
  end
end

Person.new.my
=end

#file = File.open("data.txt").each do |x|
#  puts x
#end
#file.close
=begin
file = File.write("data.txt", "Raghavendra")
File.open("data.txt").each do |x|
  puts x
end

puts File.size("data.txt")

puts File.extname("data.txt")
=end
