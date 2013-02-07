def get_count(num_str)
	sum = 0
	num_str.split(",").each do |i|
		sum += i.to_i()
	end
	return sum
end


# ピラミッドを配列に入れる
num_list = []
i = 0
fp = open("n67.txt")
fp.each do |line|
	num_list[i] = line.split(" ")
	i += 1
end
num_list = num_list.reverse

#p num_list

# 最短パスを計算
path_hash = {}

for i in 0..(num_list.size - 1)
	now_path_hash = {}

	for j in 0..(num_list[i].size - 1)
		#p "i:" + i.to_s() + " j:" + j.to_s()
		if i == 0
			now_path_hash[j] = num_list[i][j].to_s()
		else
			p " seek now:" + num_list[i][j].to_s() + " " + path_hash[j] +  " & " + path_hash[j+1]
			if get_count(path_hash[j]) > get_count(path_hash[j + 1])
				now_path_hash[j] = path_hash[j].to_s() + "," + num_list[i][j].to_s()
			else
				now_path_hash[j] = path_hash[j+1].to_s() + "," + num_list[i][j].to_s()
			end
		end
	end

	path_hash = now_path_hash
end

sum = 0
path_hash[0].split(",").each do |num|
	sum += num.to_i()
end

p sum
