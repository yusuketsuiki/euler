i = 0
num = 1
fibonacci_list = []

while 1
	if i > 1
		num = fibonacci_list[i - 1] + fibonacci_list[i -2]
	end
	
	if num.to_s().length >= 1000
		break
	end

	fibonacci_list << num
	i += 1
end

p fibonacci_list.size() + 1
