# 素数か否かを判定
def is_prime(num, prime_hash)
        flg = true
        prime_hash.each do |prime,trush|
		break if Math::sqrt(num) < prime
                if num % prime == 0
                        flg = false
                        break
                end
        end

        return flg
end


# 右から切り詰めても左から切り詰めても素数になるかを判定
def is_answer(num, prime_hash)
	# 一桁の数字は考慮しない
	if num < 10
		return false
	end

	flg = true
	num_size = num.to_s().length
	p "num:" + num.to_s()

	# 左から切り詰め
	for i in 1..num_size
		p "left:" + num.to_s()[0,i]
		if !prime_hash[num.to_s()[0,i].to_i()]
			flg = false
			break;
		end
	end

	# 右から切り詰め
	if flg
		for i in 1..num_size
			start = i - 1
			length = num_size - i + 1
			p "right:" + num.to_s()[start,length]
			if !prime_hash[num.to_s()[start,length].to_i()]
				flg = false
				break;
			end
		end
	end

	return flg
end


prime_hash = {2 => true,3 => true}
ans_list = []

i = 1
while ans_list.size() < 11
	num1 = (i * 6 - 1)
	num2 = (i * 6 + 1)

	if is_prime(num1,prime_hash)
		prime_hash[num1] = true
		if is_answer(num1,prime_hash)
			ans_list << num1
		end
	end

	if is_prime(num2,prime_hash)
		prime_hash[num2] = true
                if is_answer(num2,prime_hash)
			ans_list << num2
                end
	end
	i += 1
end

sum = 0
ans_list.each do |num|
	sum += num
end
p sum
