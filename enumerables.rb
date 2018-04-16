# Using "yield" to write the "each" method from scratch
module Enumerable
  def my_each
    i = 0
    while i < self.size
        yield(self[i])  
        i+=1      
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.size
        yield(self[i],i)  
        i+=1      
    end
    self
  end

  def my_select
    i = 0
    new_array = []
    while i < self.size
      if yield(self[i])
        new_array << self[i]
      end
      i += 1
    end
    new_array
  end

  def my_all?
    i = 0
    while i < self.size
      if !yield(self[i])
        return false
      end
      i += 1
    end
    return true
  end

  def my_none?
    i = 0
    while i < self.size
      if yield(self[i])
        return false
      end
      i += 1
    end
    return true
  end

  def my_count
    i = 0
    count = 0
    while i < self.size
      if yield(self[i])
        count += 1
      end
      i += 1
    end
    count
  end

  def my_inject(*args)
    start = args.empty? ? self.to_a[0] : args[0]
    if start.is_a?(Symbol)
      total = self.my_inject { |total,n| total.method(start).call(n)}
    elsif args[1].is_a?(Symbol)
      total = self.my_inject(args[0]) { |total,n| total.method(args[1]).call(n)}
    elsif block_given?
      i = 0
      total = start
      while i < self.size
        total = yield(total, self[i])
        i += 1
      end
    puts total
    end
  end

  # def my_map
  #   i = 0
  #   new_array = []
  #   while i < self.size
  #     new_array << yield(self[i])
  #     i += 1
  #   end
  #   new_array
  # end

  def my_map(arg = nil)
    new_array = []
    if arg && arg.respond_to?(:call) # React to a passed-in proc
      (self.length).times do |i|
        new_array << arg.call(self[i])
      end
    elsif arg == nil && block_given?
      (self.length).times do |i|
        new_array << yield(self[i])
      end
    else
      "You need a block or a proc"
    end
    new_array
  end

end

puts "my_each:"
[1,2,3].my_each { |num| puts "#{num}!" } 
puts "my_each_with_index:"
[1,2,3].my_each_with_index { |num,ind| puts "#{ind}. #{num}!" }
puts "my_select:"
puts [1,2,3].my_select { |num| num % 2 == 0 }
puts "my_all? (true, false)"
puts [1,2,3].my_all? { |num| num > 0 }
puts [1,2,3].my_all? { |num| num > 1 }
puts "my_none? (true,false)"
puts [1,2,3].my_none? { |num| num > 3 }
puts [1,2,3].my_none? { |num| num > 1 }
puts "my_count:"
puts [1,2,3].my_count { |num| num % 2 == 0 }
puts "my_inject:"
[1,2,3].my_inject(1) { |product,num| product * num }
[1,2,3].my_inject { |product,num| product * num }
[1,2,3].my_inject(:*)
[1,2,3].my_inject(2,:*)
puts "my_map:"
add_three = Proc.new { |n| n + 3}
puts [1,2,3].my_map(add_three)
puts [1,2,3].my_map { |n| n + 3}






