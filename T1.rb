
 #Reading a file 

#Reading the content of file.#whole 
# file = File.open("data.txt")
# file_data = file.read
# puts file_data
# file.close

#Reading the context of file
# file = File.open("value.txt").each do  |data| # line by line 
# puts data
# end
# file_data = file.readlines.map(&:chomp) # mutiple line at time 
# file_data = file.read
# puts file_data
# file.close


#file methods

# file = File.open("data.txt")
#   file_data = file.read
#    puts file_data

# puts file.size
# puts File.exists?("data.txt")
# puts File.extname("data.txt")
# puts File.directory?("demo")
# puts File.basename("/desktop/data.txt")#basename with floder
# puts File.dirname("/desktop/data.txt")
# puts File.rename("data.txt", "data1.txt")

#  file.close

# open('myfile.out', 'a') { |f|
#   f.puts "Hello, world."
# }

# file = File.open("data1.txt","a")  {|f| 
# f.puts "Hello, world."
# }
# # #file_data = file.read
#  puts file_data
# #file.close

# writting context a 
# file = File.open("raghu.txt","a") { |f|
# f.puts "Hello world."
# }
