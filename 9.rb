a = 2

while 1 
	sum = 0
	ans = 0
	for b in 2..a
		c = Math::sqrt((a*a) + (b*b))
		if c % 1 == 0
			sum = a + b + c
			ans = a * b * c
			p "a:" + a.to_s() + " b:" + b.to_s() + " c :" + c.to_s() + " sum:" + sum.to_s() + " ans:" + ans.to_s()
		end
	end

	break if sum == 1000
	a += 1
end

p Math::sqrt(80000)
