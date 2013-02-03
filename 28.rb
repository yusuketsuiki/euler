i = 1
num = 1
sum = 1
while i <= 1001
	if i > 1
		for j in 1..4
			num += (i - 1)
			sum += num
		end
	end
	i += 2
end

p sum
