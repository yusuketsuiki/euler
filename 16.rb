num = 2**1000
sum = 0
for i in 1..9
	sum +=  num.to_s().scan(/#{i}/).size() * i
end
p sum
