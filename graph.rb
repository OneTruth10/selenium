num = gets.chomp.split(" ")
rows = []
connected = {}
(1..num[1].to_i).each do |x|
    rows << gets.chomp
end

connected = {}
rows.each do |row|
    col = row.split(" ")
    if col.size == 3gi
        if col[1].to_i > col[2].to_i
            ver = col[1] + col[2]
        else 
            ver = col[2] + col[1]
        end
        if col[0] == "1"
            if connected.key?(ver.to_sym)
                puts "1"
            else
                puts "0"
            end
        elsif col[0] == "0"
            if !connected.key?(ver.to_sym)
                connected[ver.to_sym] = 1
            end
        end
    end
end

            