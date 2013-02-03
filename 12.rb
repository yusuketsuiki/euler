def get_divisora(sum)
	j = 0
	for i in 1..Math::sqrt(sum)
		if sum % i == 0
			j += 1
		end
	end
	p sum.to_s() + " : " + (j*2).to_s()

	return j * 2
end

i = 1 
sum = 0
while 1
	sum += i
	i += 1

	# 約数
	divi = get_divisora(sum)
	if divi >= 500
		p sum
		p divi
		break
	end
end
