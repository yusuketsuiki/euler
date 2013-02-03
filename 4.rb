def is_kaibun(n,m)
	num = n * m
	flg = true
	keta = num.to_s().length
	

	i = 0
	j = keta - 1
	for i in 0..j
		if num.to_s()[i,1] != num.to_s()[j,1]
			flg = false
			break
		end
		break if i == j || i > j
		i = i+1
		j = j-1
	end
	if flg
		return num
	end
	return nil
end

num_list = []
for n in 100..999
	for m in 100..999
		if n <= m
			num = is_kaibun(n,m)
			if num
				num_list << num
			end
		end
	end
end

p num_list.max
