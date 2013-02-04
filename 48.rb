sum = 0
for num in 1..1000
	sum += num**num
end
sum = sum.to_s()
p sum[sum.length() - 10, sum.length()]
