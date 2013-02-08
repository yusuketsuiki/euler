# 素因数の数を調べて返却。ついでに素数の場合はprime_listへ追加
def get_prime_num(num, prime_list)
	sum = 0
        flg = true
        prime_list.each do |prime|
		break if num / 2 < prime
                if num % prime == 0
                        flg = false
			sum += 1
                end
        end

	# flgがtrueで、素数の要件を満たす場合は素数に追加
	if flg && (num % 6 == 1 || num % 6 == 5)
		prime_list << num
	end

	if sum >= 4
		p "num:" + num.to_s() + " sum:" + sum.to_s()
	end
        return sum
end


# main
prime_list = [2,3]
num = 4
num_list = []
while num_list.size() < 4
	#p "num:" + num.to_s() + " prime_num:" + get_prime_num(num,prime_list).to_s()
	
	if get_prime_num(num,prime_list) == 4
		num_list << num
	else
		num_list = []
	end
	num += 1
end

p num_list
