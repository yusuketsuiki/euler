def get_number(num)
	base_count = {1 => 3, 2 => 3, 3 => 5, 4 => 4, 5 => 4, 6 => 3, 7 => 5, 8 => 5, 9 => 4, 0 => 0}
	keta_count = {2 => 4,3 => 4, 4 => 4, 5 => 3, 6 => 3, 7 => 5, 8 => 4, 9 => 4}
	numlen = num.to_s().length

	sum = 0

	if numlen == 1
		sum =  base_count[num]
	elsif numlen >= 2
		# 下二桁を判定
		simo1 = num.to_s()[num.to_s().length - 1,1]
		simo2 = num.to_s()[num.to_s().length - 2,1]

		if simo2 == "0"
			sum += base_count[simo1.to_i()]
		elsif simo2 == "1"
			# 10,11,12は特殊処理
			if simo1 == "0"
				sum += 3
			elsif simo1 == "1"
				sum += 6
			elsif simo1 == "2"
				sum += 6
			else
				sum += keta_count[simo1.to_i()] + 4  # "teen"の4
			end
		else
			sum += keta_count[simo2.to_i()] + 2  # "ty"の2
			sum += base_count[simo1.to_i()]

			# fourtyではなくfortyでカウントするので、2の桁が4の時はマイナス1
			sum -= 1 if simo2 == "4"
		end

		# 下三桁を判定
		if numlen == 3
			simo3 = num.to_s()[num.to_s().length - 3,1]
			sum += base_count[simo3.to_i()]
			sum += 7  # "hundred"の分

			if simo1 != "0" || simo2 != "0"
				sum += 3  # "and"のぶん
			end
		end

		# 1000を判定
		if numlen == 4
			sum = 11
		end
	end

	return sum
end

sum = 0
for i in 1..1000
	num = get_number(i)
	p "i:" + i.to_s() + " count:" + num.to_s()
	sum += num
end

p sum
