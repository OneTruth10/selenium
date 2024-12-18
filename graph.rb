class UnionFind
  def initialize(size)
    @parent = Array.new(size) { |i| i }
    @rank = Array.new(size, 0)
  end

  def find(x)
    if @parent[x] != x
      @parent[x] = find(@parent[x]) # Path compression
    end
    @parent[x]
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)

    return if root_x == root_y

    if @rank[root_x] > @rank[root_y]
      @parent[root_y] = root_x
    elsif @rank[root_x] < @rank[root_y]
      @parent[root_x] = root_y
    else
      @parent[root_y] = root_x
      @rank[root_x] += 1
    end
  end

end

num = gets.chomp.split(" ")
rows = []
(1..num[1].to_i).each do |x|
    rows << gets.chomp
end

vertices = UnionFind.new(num[0])

# Processing queries
rows.each do |row|
  row = gets.chomp.split.map(&:to_i)
  type, u, v = row[0], row[1].to_i, row[2].to_i

  if type == 0
    vertices.union(u, v)
  elsif type == 1
    if find(u)==find(v)
      puts "1"
    else
      puts "0"
    end
  end
end