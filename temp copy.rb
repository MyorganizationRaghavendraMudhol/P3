require 'csv'
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


def get_binding(x)
    binding
  end
b = get_binding("hello")
