module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
  end

  def my_select
    new_array = []
    for item in self
      if yield(item) == true
        new_array << item
      end
    end
    new_array
  end

  def my_all?
    for item in self
      if yield(item) == false
        return false
      end
    end
    return true
  end

  def my_any?
    for item in self
      if yield(item) == true
        return true
      end
    end
    return false
  end

  def my_none?
    for item in self
      if yield(item) == true
        return false
      end
    end
    return true
  end

  def my_count
    total = 0
    if block_given?
      for item in self
        if yield(item) == true
          total += 1
        else 
          total += 0
        end
      end
    else 
      total = self.length
    end
    total
  end

  def my_map
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end
  
  def my_inject(value)
    total = value
    for item in self
      total = yield(total, item)
    end
    total
  end

end