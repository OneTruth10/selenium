def bill_combination(n,y)
    (0..n).each do |i|
        (0..(n-i)).each do |j|
            k = n - i - j
            if (i*10000+j*5000+k*1000)==y
                return [i,j,k]
            end
        end
    end
    return [-1,-1,-1]
end

n,y=gets.chomp.split(" ").map(&:to_i);

puts bill_combination(n,y).join(" ")