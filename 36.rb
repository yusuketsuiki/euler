def is_kaibun(num)
        flg = true
        keta = num.to_s().length

        i = 0
        j = keta - 1
        for i in 0..j
                if num.to_s()[i,1] != num.to_s()[j,1]
                        flg = false
                        break
                end
                break if i == j || i > j
                i = i+1
                j = j-1
        end
        if flg
                return true
        end
        return false
end

sum = 0
for num in 1..999999
	sum += num if is_kaibun(num) && is_kaibun(num.to_s(2).to_i())
end

p sum
