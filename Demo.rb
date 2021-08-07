$count = 0
class Customer
  attr_accessor :id, :name, :points, :group, :avg

  def initialize(cust_id, name)
    @id = cust_id
    @name = name
  end

  def add_points(given_amount)
    @points = given_amount
  end

  def upgrade_points(given_percentage)
    @upgradepoint = @points * given_percentage / 10
    # @points = @points + @upgradepoint
    @points += @upgradepoint
  end

  def remove_points(*)
    # @points = @points - remove_point
    @points -= @remove_point
    if @points.negative? puts "Amount value is negative so i'm making it to #{@points}"
    elsif puts "Amount value is not negative so i'm making it to #{@points}"
    end
  end

  def compute_group(points, group)
    @point = points
    @group = group
      @i = 0
    while @points.positive?
      if @point < 100 && @points > 1
        @group = 'Silver'
      elsif @point <= 500 && @point > 100
        @group = 'Gold'
      elsif @point <= 2000 && @point > 500
        @group = 'Diamond'
      elsif @point > 2000
        @group = 'Platinum'
      end
        break
    end
  end

  def display
    $count = $count + 1
    puts "…………………………… Customer: #{$count} Id: #{@cust_id}  Name: #{@name} Points: #{@points} Group: #{@group} "
  end

  def self.get_best(get_arr)
    m = get_arr.max
    puts "MAX: #{m}"
  end

  def self.cal_avg(get_arr)
    sum = get_arr.inject(:+)
    avg = sum / $count
  end

  def self.display_avg(val)
    avg = val
    puts "Average of points is #{avg}"
  end
end

class Test
  def display
    arr = []
    c = []

    c0 = Customer.new(1543, 'Nimal')
    c0.add_points(129)
    arr << c0.points
    c0.compute_group(c0.points, 'metal')
    c0.display
    c << c0

    c1 = Customer.new(6561, 'Saman')
    c1.add_points(785)
    # b = c1.upgrade_points(2)
    arr << c1.points
    c1.compute_group(c1.points, 'metal')
    c1.display
    c << c1

    c2 = Customer.new(6954, 'Kasun')
    a = c2.add_points(3258)
    # a = c2.add_points(1000)
    arr << c2.points
    c2.compute_group(c2.points, 'metal')
    c2.display
    c << c2

    c3 = Customer.new(3485, 'Nayana')
    c3.add_points(59)
    arr << c3.points
    c3.compute_group(c3.points, 'metal')
    c3.display
    c << c3

    c4 = Customer.new(8546, 'Kalpa')
    p = c4.add_points(1652)
    arr << c4.points
    c4.compute_group(c4.points, 'metal')
    c << c4
    c[4].display
    # something
    # c4.compute_group(5000, 'Raghu')
    # c4.display
    a = Customer.cal_avg(arr)
    Customer.display_avg(a)
    # highest number of points using the method get_best
    Customer.get_best(arr)

    cust = Customer.new(1543, 'Nimal')
    cust = c3
    cust.display
    # cust.remove_points(2000)
    cust.display

    cust1 = Customer.new(1, 'Raghu')
    cust1 = cust
    cust1 = nil
    #puts Cust1.id
  end
end

 t = Test.new
 t.display
