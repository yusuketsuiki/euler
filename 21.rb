def get_divisora(num)
	sum = 0
	for i in 1..Math::sqrt(num)
		# 約数
		if num % i == 0
			j = num / i
			sum += i
			sum += j if i != j
		end
	end

	sum -= num
	return sum
end

divi_list = {}
for num in 1..10000
	# 約数
	divi = get_divisora(num)
	divi_list[num] = divi
end


sum = 0
divi_list.each do |num,divi|
	#p "num:" + num.to_s() + " divi:" + divi.to_s()

	if divi != num && divi_list[divi] == num
		p "num:" + num.to_s() + " divi:" + divi.to_s()
		sum += num
	end
end

p sum
