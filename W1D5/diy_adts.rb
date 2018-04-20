class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index { |pair| pair[0] == key }
    pair_index ? @map[pair_index][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
    nil
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(array)
    new_array = []
    array.each do |el|
      if el.is_a? (Array)
        new_array << deep.dup(el)
      else
        new_array << el
      end
    end

    new_array
  end
end
