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

# 巡回素数かを判定
def is_circular_prime(num, prime_hash)
    flg = true

    num_str = num.to_s()

    # 一桁の数は巡回素数
    return true if num_str.length == 1
    
	for i in 1..num_str.length
		# 巡回
		new_str = ""
		for j in 1..(num_str.length - 1)
			new_str += num_str[j,1]
		end
		new_str += num_str[0,1]
		num_str = new_str
        
        # 素数か否かを判定
        new_num = new_str.to_i()
        if new_num % 6 != 1 && new_num % 6 != 5 || !is_prime(new_num, prime_hash)
            flg = false
            break
        end
	end
    
    return flg
end


# main
prime_hash = {2 => true,3 => true}
sum = 2

i = 1
while (i * 6 -1) < 1000000
	num1 = (i * 6 - 1)
	num2 = (i * 6 + 1)

	if is_prime(num1,prime_hash)
		prime_hash[num1] = true
        if is_circular_prime(num1,prime_hash)
            p num1
            sum += 1
        end
    end

	if is_prime(num2,prime_hash)
		prime_hash[num2] = true
        if is_circular_prime(num2,prime_hash)
            p num2
            sum += 1
        end
    end

    i += 1
end

p sum