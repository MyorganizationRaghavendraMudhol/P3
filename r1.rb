class Demo
  def careerFair(arrival, duration)
    interval = [[arrival[i], arrival[i] + duration[i]] 
    for i in range(len(arrival))
    interval.sort(key = lambda x : (x[0], x[1]))
    not_working = []
    prev = interval[0][1]
    for i in range(1, len(interval))
        if interval[i][0] < prev
            not_working.append(1)
        else
            prev = interval[i][1]
    end
    return len(arrival) - len(not_working)
   end 
end

Obj = Demo.new
obj.careerFair([1,2,3,5], [4,1,1,5])
