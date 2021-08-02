str = "Raghavendra"
p str.length
p str.reverse
p str.count("a")
p str.upcase
p str.downcase
# p str.trim

str.prepend("Hello ")
str.each_char.with_index do |v,i|
	p v,i
end


str.each_char.with_index(1) do |v,i|
	p v,i
end


str.each_byte do |a|
	p a
end

str.each_char do |a|
   if ('a'||'e'||'i'||'o'||'u').include?(a)
   p a 
   end
end



if str.include?("p")
	p true
else
	p false

end



p str.gsub("R","L")

p str.sub("Ragh","hey")

p str

p str.chomp(" ")

str2 = "Mudhol"

p str<<str2

str3 = " hey"

a = "hello" 
a.insert(a.length, " world") 
# "hello world"

p str.slice(0,2)
