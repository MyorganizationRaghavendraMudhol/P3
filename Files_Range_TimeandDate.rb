#Time and date
#How many aberration for time format and what are they.
#time formtaing
#strftime 
1.t.strftime("%d-%m-%y")# => "09-12-20" 
2.t.strftime("%k:%M") #=> "10:23" #Minutes and hour
3.t.strftime("%I:%M %p") #=> "10:23 AM" Hour,min,AM/PM
4.t.strftime("Today is %A") #=> "Today is Wednesday"  Day
5.t.strftime("%d of %B, %Y") #=> "09 of December, 2020" Day Month year

#strptime
Date.strptime("3 of September", "%d of %B")# define our own custom format
#=> #<Date: 2020-09-03 ((2459096j,0s,0n),+0s,2299161j)> 

#Date.parse
Date.parse("12-12-2020") # converts given string into date object ,which looks like date=> #<Date: 2020-12-12 ((2459196j,0s,0n),+0s,2299161j)> 

Date::MONTHNAMES #it has some constants values.
 #=> [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] 
Date::MONTHNAMES.rotate(1)
 #=> ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"] 



#conditional on Ranges

(1..5).include?(2) #true
(1..5).cover?(3) #true
(0..2).eql?(0...2) #false
(1..5).exclude_end? #false
(1...5).size #4
(0..ary.size).bsearch {|i| ary[i] > 4 } # 2 position 

#implemention of range
 def range(a, b)
 return [] if a > b
 Empty = []
 while a != b
 Empty << a
 a = a.next
 end
 Empty << a
 end
 puts range(1,2) 

#Files 

# 1. reading the content of file 
file = File.open("data.txt")
 file_data = file.read
 puts file_data
 file.close

#2.File methods

 file = File.open("data.txt")
   file_data = file.read
    puts file_data

 puts file.size
 puts File.exists?("data.txt")
 puts File.extname("data.txt")
 puts File.directory?("demo")
 puts File.basename("/desktop/data.txt")#basename with floder
 puts File.dirname("/desktop/data.txt")
 file.close


#3.writting context at eof.
 file = File.open("raghu.txt","a") { |f|
 f.puts "Hello world." }



# Iterators types
#1.Each Iterator - returns all the elements of an array or a hash
  array =['abc','abd','abe','abf']
	array.each do |e|
 	puts e
 	end

	# abc
	# abd
	# abe
	# abf

	array1 = ['Raghu','Surenthar','vaibhav','bharani','krishna']
  array1.each do |array1|
  puts array1
   end


# Raghu
# Surenthar
# vaibhav
# bharani
# krishna

array2 = [123,456,789,101112]

array2.each do |e|
 puts e
 end

# 123
# 456
# 789
# 101112
array3 = [123,'abc','!!!','@@@']
array3.each do |e|
puts e
end

# 123
# abc
# !!!
# @@@

#2.collect Iterator-returns an entire collection, regardless of whether it is an array or hash.
array5 = [12,34,24,10]
b = array5.collect{|a| a*2 }
#[24, 68, 48, 20] 

 array6 = [12,34,24,10]
  b = array6.collect{|a| a*2/6 }
  #[4, 11, 8, 3] 

 #3.Time Iterator- a loop is implanted with the specific number of time,started from intial zero ends with specified numb.
 2.times do |i|
 	puts i
 end
 #0
 #1

 7.times do |i|
 	puts i
 end

# 0
# 1
# 2
# 3
# 4
# 5
# 6

#4.Upto Iterator - follows top to bottom approach
1.upto(14) do |n|   
puts n
end
#1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10
# 11
# 12
# 13
# 14

2.upto(7) do |n|
	puts n 
end
# 2
# 3
# 4
# 5
# 6
# 7

#5.downto Iterator - follows bottom to top approach
7.downto(7) do |n|   
puts n
end
# 7
# 6
# 5
# 4
# 3
#2
7.downto(7) do |n|   
puts n
end
#7

#6.step Iterator -  the user has to skip a specified range
(0..10).step(2) do|i| 
    puts i 
end

# 0
# 2
# 4
# 6
# 8
# 10

#7.Each_line Iterator - iterate over a new line in string
"Ragav/surentar".each_line do|i| 
puts i 


#Ragav/surentar





