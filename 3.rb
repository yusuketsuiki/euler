num = 600851475143
ans_list = []

if num % 2 == 0
	ans_list << 2
end

if num % 3 == 0
        ans_list << 3
end

if num % 5 == 0
        ans_list << 5
end


i = 6
while ((i - 1) <= Math::sqrt(num))
	if (i - 1) > 5
		ans_list << (i - 1) if num % (i - 1) == 0
	end

	if (i + 1) < Math::sqrt(num)
		ans_list << (i + 1) if num % (i + 1) == 0
	end
	i += 6
end

ans_list.each do |n|
	flg = true
	ans_list.each do |n2|
		if n < n2
			break
		end
		if n != n2 && n % n2 == 0
			flg = false
			break
		end
	end
	if flg
		p n
	end
end
