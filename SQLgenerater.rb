all = File.readlines("schedule.txt")
all = all.map{|x| x.chomp}.map{|x| x.delete(" ")}
puts "現在の年数は？"
year = gets.to_i
def zero_adder(str, mid, endSign)
  if str.index(mid)<2
    str.insert(str.index(mid)-1, "0")
  end
  if str.index(endSign) - str.index(mid)<3
    str.insert(str.index(mid)+1,"0")
  end
  return str
end
n = 0
cmd = ""
dateIndex = []
timeIndex = []
date = []
all.each do |item|
  if item.include?("/") && !item.include?(":") && !item.include?("駅")
    dateIndex.push(n)
  elsif item.include?(":")
    timeIndex.push(n)
  end
n = n +1
end
r = 1
timeIndex.each do |item|
  date = all[dateIndex.take_while{|n| n<item}.last]
  date = zero_adder(date, "/", "(").slice(0..4)
  time = all[item]
  startT = zero_adder(time, ":", "-").slice(0..4)
  endT = time.slice(6..10)
  locIndex = all[item+1].index("駅")
  location = all[item+1].slice(0..locIndex)
  cmd = cmd + "insert into schedule (location, starting_time, ending_time) values('#{location}','#{year}/#{date} #{startT}:00','#{year}/#{date} #{endT}:00');\n"
  r = r+1
end

File.write("toSQL.txt",cmd)
