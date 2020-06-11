
class CircularQueue
  attr_reader :size
  attr_accessor :oldest_idx, :last_added_idx, :arr
  def initialize(size)
    @arr = Array.new(size)
    @size = size
    reset_index
  end

  def num_items 
    size - arr.count(nil)
  end

  def []=(idx, value)
    arr[idx] = value
  end

  def [](idx)
    arr[idx]
  end

  def reset_index 
    @oldest_idx = 0
    @last_added_idx = 0 
  end 

  def increment_oldest_idx
    if oldest_idx == size - 1
      self.oldest_idx = 0 
    else
      self.oldest_idx += 1 
    end 
  end

  def increment_last_added_idx 
    if last_added_idx == size - 1
      self.last_added_idx = 0
    else
      self.last_added_idx += 1 
    end
  end

  def enqueue(item)
    if num_items == 0
      self[0] = item
      reset_index
    elsif num_items == size 
      self[oldest_idx] = item 
      increment_last_added_idx
      increment_oldest_idx
    else
      increment_last_added_idx
      self[last_added_idx] = item 
    end
  end

  def dequeue
    if num_items == 0
      nil 
    elsif num_items >= 1
      removed_value = arr[oldest_idx]
      self[oldest_idx] = nil
      increment_oldest_idx
      return removed_value
    end
  end
end

# Their solution

class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
    end

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

# new = CircularQueue.new(3)
# puts new.num_items
# puts new.oldest_idx
# puts new.last_added_idx
# new.increment_oldest_idx
# puts new.oldest_idx
# new.increment_oldest_idx
# puts new.oldest_idx
# new.increment_oldest_idx
# puts new.oldest_idx
# new.increment_last_added_idx
# new.increment_last_added_idx  
# puts new.last_added_idx
# new.increment_last_added_idx
# puts new.last_added_idx



