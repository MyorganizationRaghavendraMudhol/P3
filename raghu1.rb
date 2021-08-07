

Regarding this one, yesterday we had a call with Jeremy, he suggested have we have to implement a  feature flag, when we are deactivating a user with alias accounts and we have add logs also.# a  = [1,4,5,6]
# b = [1,4]

# result = a - b
# puts result.count
# puts "********"
# arr = []
# arr << result
# puts arr
class A

	def checkIfAnyEven(arr, n)  
    	flag = false; 
    	for i in 1..5  
        	if (arr[i] % 2 == 0) 
            	flag = true; 
             	break;
   			end
   		end
   		puts flag	
   	end	

 end
 
 ob = A.new
 arr = [1,3,2,5,6,7]
 ob.checkIfAnyEven(arr,2)