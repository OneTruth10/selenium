class FenwickTree
    def initialize(size)
        @tree = Array.new(size+1, 0)
        @size = size
    end

    def prefix_sum(index)
        index += 1
        sum = 0
        while index > 0
            sum += @tree[index]
            index -= index & -index
        end
        return sum
    end
    
    def range_sum(first, last)
        return prefix_sum(last-1)-prefix_sum(first-1)
    end

    def update(index, x)
        index += 1
        while index <= @size
            @tree[index] += x
            index += index & -index
        end
    end
end

n, q = gets.split.map(&:to_i)
array = gets.split.map(&:to_i)

fenwick = FenwickTree.new(n)

array.each_with_index do |value, index|
  fenwick.update(index, value)
end

q.times do
  query = gets.split
  type = query[0].to_i

  if type == 0
    p, x = query[1].to_i, query[2].to_i
    fenwick.update(p, x)
  elsif type == 1
    l, r = query[1].to_i, query[2].to_i
    puts fenwick.range_sum(l, r)
  end
end 

