def is_prime(num, prime_list)
        flg = true
        prime_list.each do |prime|
		break if Math::sqrt(num) < prime
                if num % prime == 0
                        flg = false
                        break
                end
        end

        return flg
end


prime_list = [2,3]

i = 1
while prime_list.size() < 10001
	prime_list << (i * 6 - 1) if is_prime((i * 6 - 1),prime_list)
	prime_list << (i * 6 + 1) if is_prime((i * 6 + 1),prime_list)
	i += 1
end

p prime_list[10000]
