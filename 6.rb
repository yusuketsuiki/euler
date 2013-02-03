sum1 = 0
sum2 = 0

for i in 1..100
	sum1 += i * i
	sum2 += i
end

sum2 = sum2 * sum2
p sum2 - sum1
