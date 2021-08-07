class Demo

def careerFair(arrival, duration)
    interval = [[arrival[i], arrival[i] + duration[i]] for i in range(len(arrival))]
    interval.sort(key = lambda x : (x[0], x[1]))
    not_working = []
    prev = interval[0][1]
    for i in range(1, len(interval)):
        if interval[i][0] < prev:
            not_working.append(1)
        else:
            prev = interval[i][1]
    return len(arrival) - len(not_working)

end
end

obj = Demo.new
obj.careerFair([1, 3, 3, 5, 7], [2, 2, 1, 2, 1])
