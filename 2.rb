r = [1,2]
i = 0
sum = 2 

while
	num = (r[i] + r[i+1])
	break if num >= 4000000
	r << num

	sum = sum + num if num % 2 == 0
	i = i+ 1
end

p sum
