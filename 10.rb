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
while (i * 6 - 1) < 2000000
    p "i:" +(i * 6 - 1).to_s() + " size:" + prime_list.size().to_s()
	prime_list << (i * 6 - 1) if is_prime((i * 6 - 1),prime_list)
	prime_list << (i * 6 + 1) if is_prime((i * 6 + 1),prime_list)
	i += 1
end

sum = 0
prime_list.each do |prime|
    sum += prime
end
p sum