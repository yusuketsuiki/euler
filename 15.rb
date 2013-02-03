def get_factorial(num)
	sum = 1
	while num > 0
		sum = sum * num
		num -= 1
	end

	return sum
end


def get_paths(num)
	return get_factorial(num * 2) / (get_factorial(num) ** 2 )
end

for i in 1..20
	p "i:" + i.to_s() + " paths:" + get_paths(i).to_s()
end
