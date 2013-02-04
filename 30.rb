def judge(num, raise)
	sum = 0
	for i in 0..(num.to_s().length - 1)
		sum += num.to_s()[i,1].to_i() ** raise
	end

	#if num < sum
	#	p "num:" + num.to_s() + " sum:" + sum.to_s()
	#end

	return num == sum
end

sum = 0
for num in 1..1000000
	sum += num if judge(num, 5) && num != 1
end

p sum
