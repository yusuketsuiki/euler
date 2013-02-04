# 階乗を算出
def get_kaijou(num)
	# 一桁の階乗のみなのでハッシュを使って高速化
	kaijou_hash = {0 => 1,1 => 1, 2 => 2, 3 => 6, 4 => 24, 5 => 120, 6 => 720, 7 => 5040, 8 => 40320, 9 => 362880}
	return kaijou_hash[num]
end

#def get_kaijou2(num)
#	return 0 if num == 0
#
#	sum = 1
#	for i in 1..num
#		sum = sum * i
#	end
#	return sum
#end

# 桁ごとにわけて階乗の和を算出
def get_answer(num)
	sum = 0
	for i in 0..num.to_s().length - 1
		sum += get_kaijou(num.to_s[i,1].to_i())
	end
	return sum
end

list = []
sum = 0
for num in 10..2000000
	ans = get_answer(num)
	if num > ans
		#p "num:" + num.to_s() + " ans" + ans.to_s()
		#list << num
	end

	#p list.size() if num % 10000 == 0
	
	
	if ans == num
		p ans
		sum += ans
	end

	#p num
	num += 1
end

p sum
