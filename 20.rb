i = 100
num = 1
while i > 1
	num = num * i
	i -= 1
end
p num

sum = 0
for j in 1..9
	sum +=  num.to_s().scan(/#{j}/).size() * j
end
p sum
