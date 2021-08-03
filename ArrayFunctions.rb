#length
arr = [1,2,3,4,5,6,7]
p arr.count

arr1 = [4,5,6]

#adding element to an array

p arr.push(8)
p arr.push(9)
p arr.push(10)
p arr.push(2)

p arr

###Removing first element in array permentaly
p arr.shift
p arr

##Removing last element in array permently

p arr.pop
p arr



##Adding first element in array permentaly

p arr.unshift(1)
p arr 

##Adding first element in array permentaly
p arr.push(10)
p arr 

##Removing an element at specfic position in array

p arr.delete_at (2)
p arr

##Reverese an array

p arr.reverse
p arr

##Search element in an array
p arr.include?(2)

##Select returns new array only true values
arr
p arr.select { |number| number > 5 }

##collect return new array contains all values
p arr.collect { |number| number > 5 }


##join
p arr.join("*")

##each iterators over an array and perform action on them
arr.each do |v|
	p v
end

##map

# .map
# The .map method is the same as the .collect method. The .map and .collect methods iterate over each element of the array, allowing you to perform actions on them. The .map and .collect methods differ from the .each method in that they return an array containing the transformed elements.

# arr.map { |number| number * 2 }
#   puts number

p arr.uniq

##concat

p arr << arr1

p arr.concat([11,12,13],[31,32,33])

