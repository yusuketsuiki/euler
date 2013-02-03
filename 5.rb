parge_list = {}
num = 20
sum = 1

num.downto(1).each do|i|
	# 何の数をかけるか
	kake = i
	parge_list.each do|key, value|
		kake = kake / key if kake % key == 0
	end
	

	# 約数を抽出
	for j in 1..(num / 2)
		if i % j == 0
			parge_list[j] = true
		end
	end

	if !parge_list[i]
		sum = sum * kake
	end

end

p sum
