1) Suppose you have to develop an information system for a food city. Points are added to the customer depending on the purchases made. The customers are grouped based on the number of points. 
a) Create a class called Customer that includes attributes: id, name, points, group, and avg with data types: “int”, “String”, “double”, “String”, and “double” respectively. 
b) Include a constructor with parameters: id and name.
c) Include a method called addPoints that is used to add a given amount to the value of the attribute points. 
d) Include a method called upgradePoints that is used to increase the value of the attribute points by a given percentage. 
e) Include a method called removePoints that is used to reduce a given amount from the value of the attribute points. If the resultant value is negative then the value of the attribute should be set into zero. 
f) Include a method called computeGroup that assigns a value to the attribute group based on the value of the attribute points as given in the following table. points group points < 100  Silver 100 ≤ points < 500 Gold 500 > points ≤ 2000 Platinum 2000 < points Diamond
g) Include a method called display to display the values of all the attributes of a Customer object. 
i) Include a static method called displayAvg to display the value of the attribute avg.
h) The attribute avg should be assigned the average value of points of each customer. Include a static method called calAvg to calculate the value of the attribute avg. 
#j) Include a static method called getBest that returns the value of the attribute id of the customer with maximum number of points. 
k) Create the driver class called Test that includes the “main” method. 
l) Create an array that holds five Customer objects. Assign the objects given in the following table to each array element using the parameterized constructor. id 1543 6561 6954 3485 8546 name Nimal Saman Kasun Nayana Kalpa 
m) Use the method addPoints to add following points respectively to each Customer object created above. 129 785 3258 59 1652 
#n) Add extra 1000 points to the third customer using the method addPoints. 
o) Increase the points of the second customer by 2% using the method upgradePoints. 
p) Include a method called display to the class Test that displays all the attributes of each customer. Each set of attributes should be separated by a sequence of dots. The part of output for the first customer is given below. …………………………… Customer: 1 ID: 1543 Name: Nimal Points: 129.0 Group: null Average: 0.0 
q) Invoke the method display of the class Test.
r) Compute the average of points using the method calAvg. 
s) Compute the group of each customer using the method computeGroup. You should use a loop.
t) Again invoke the method display of the class Test. 
# u) Display the value of the attribute id of the customer with highest number of points using the method getBest. 
# v) Invoke the method displayAvg using each Customer, c[0], c[1], c[2], c[3], and c[4] as references. #
w) Create a reference variable called cust of type Customer. 
x) Assign fifth Customer object to the reference variable cust. You should use the object you have already created. 
y) Reduce 2000 points from the fifth customer using the method removePoints. You should invoke the method using the reference variable cust.
z) Invoke the method display of the class Customer using the array element c[4] to display the values of attributes of the fifth customer. Done
aa) Update the group of the fifth customer invoking the method computeGroup. 
bb) Invoke the method calAvg again to find the new average of points. #bucket
cc) Create a Customer object with default values to its attributes by using the appropriate constructor. The object should be assigned to the reference variable cust. 
dd) Copy the values of the attributes of the fourth customer to the corresponding attributes of the object pointed by the reference variable cust. 
ee) Create another reference variable called cust1 of type Customer. 
ff) Assign the object pointed by the reference variable cust to cust1 as well. 
gg) Delete the object pointed by the reference variable cust. 
hh) Execute the statement cust1.id to verify the deletion of the object.