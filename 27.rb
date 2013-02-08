# 素数か否かを判定
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

# 上限の数まで素数を生成
def set_prime_list(limit,prime_list)
	i = 1;
	now_max = prime_list[prime_list.size() - 1]

	# iの数を算出
	if now_max > 3
		if now_max % 6 == 1
			i = (now_max - 1) % 6 + 1
		else
			i = (now_max + 1) % 6 + 1
		end
	end

	while (i * 6 - 1) <= limit
		if now_max < (i * 6 - 1)
			prime_list << (i * 6 - 1) if is_prime((i * 6 - 1),prime_list)
		end

		if now_max < (i * 6 + 1)
			prime_list << (i * 6 + 1) if is_prime((i * 6 + 1),prime_list)
		end
		i += 1
	end

	return prime_list
end

# 二次式を計算し、素数か否かを判定
def get_answer(kumi, prime_list)
	a = kumi["a"]
	b = kumi["b"]
	n = 0
	cnt = 0
	while 1
		sum = n**2 + (a * n) + b
		#p "a:" + a.to_s() + " b:" + b.to_s() + " n:" + n.to_s() + " sum:" + sum.to_s()
		flg = false

		# sumは素数か？
		if sum >= 2 && (sum % 6 == 1 || sum % 6 == 5)
			# sumが現在算出している最大素数より多い場合は、算出しなおし
			if sum > prime_list[prime_list.size() - 1]
				prime_list = set_prime_list(sum,prime_list)
			end

			flg = true if is_prime(sum,prime_list)
		end

		break if !flg

		n += 1
	end

	return n
end


# main
#------------------------------
# n**2 + (a * n) + b = 素数
# a < 1000の絶対数、b < 1000
#------------------------------
# 上記において、n=0の時を考えるとb=素数
# n=1の時を考えると、1 + a + b = 素数
# この条件に当てはまる組み合わせを絞り、後は総力戦

prime_list = [2,3]

# bの候補を絞る
prime_list = set_prime_list(999,prime_list)
b_list = Marshal.load(Marshal.dump(prime_list))

# aの候補を絞り、組み合わせを作成
kumi_list = []
prime_list = set_prime_list((1 + 999 + 999), prime_list)
b_list.each do |b|
	# aが負の数の場合、1 + b - a >= 2になる必要がある
	a_min = 0 -(b - 1)
	
	for a in a_min..999
		sum = 1 + a + b

		# sumが素数かを判定する前に簡易判定
		if sum % 6 == 1 || sum % 6 == 5
			if is_prime(sum,prime_list)
				kumi_list << {"a" => a, "b" => b}
				p "a:" + a.to_s() + " b:" + b.to_s() + " sum:" + sum.to_s()
			end
		end
	end
end

max = 0
max_kumi = ""
kumi_list.each do |kumi|
	num = get_answer(kumi, prime_list)
	p num
	if max < num
		max = num
		max_kumi = kumi
	end
end

p max_kumi
p max
p "ans:" + (max_kumi["a"] * max_kumi["b"]).to_s()
