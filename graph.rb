def next_point(x,y,connected,called=[])
    called << x
     if connected.key?(x) && connected[x].include?(y)
        return true
    elsif connected.key?(x) && (connected[x]-called).any?
        (connected[x]-called).each do |n|
            if next_point(n,y,connected,called)==true
                return true
            end
        end
    elsif !connected.key?(x)
        return false
    elsif connected[x].include?(y)
        return true   
    else
        return false
    end
end


num = gets.chomp.split(" ")
rows = []
connected = {}
(1..num[1].to_i).each do |x|
    rows << gets.chomp
end

connected = {}
rows.each do |row|
    col = row.split(" ")
    if col[0] == "1"
        if next_point(col[1],col[2],connected)==true
            puts "1"
        else
            puts "0"
        end
    elsif col[0] == "0"
        connected[col[1]] = connected.fetch(col[1],[]) 
        connected[col[1]] << col[2]
        connected[col[2]] = connected.fetch(col[2],[])
        connected[col[2]] << col[1]
    end
end

            