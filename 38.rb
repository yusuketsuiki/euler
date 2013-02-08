# 検証する値は1〜9999
num_list = []

for num in 1..9999
	sum_str = ""

	# 1から掛けあわせていく
	i = 1
	while sum_str.length < 9
		sum_str += (num * i).to_s()
		i += 1
	end

	if sum_str.length() == 9
		#p sum_str
		flg = true
		for j in 1..9
       			if sum_str.scan(/#{j}/).size() != 1
				flg = false
				break
			end
		end

		if flg
			num_list << sum_str.to_i()
		end
	end
end

num_list = num_list.sort
num_list.each do |num|
	p num
end
