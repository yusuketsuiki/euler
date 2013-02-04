# アルファベットをスコア変換
def get_score(name)
	alfa_hash = {"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10, "K" => 11, "L" => 12, "M" => 13, "N" => 14, "O" => 15, "P" => 16, "Q" => 17, "R" => 18, "S" => 19, "T" => 20, "U" => 21, "V" => 22, "W" => 23, "X" => 24, "Y" => 25, "Z" => 26}
	score = 0
	alfa_hash.each do |key,value|
		score += name.scan(/#{key}/).size() * value
	end

	return score
end


# main
names = []
fp = open("n42.txt")
fp.each do |line|
	line = line.gsub('"',"")
	names = line.split(",")
end

# スコア単位の出現回数をハッシュ化
score_hash = {}
names.sort.each do |name|
	if !score_hash[get_score(name)]
		score_hash[get_score(name)] = 1
	else
		score_hash[get_score(name)] += 1
	end
end

# スコアの最大値を取得
max = 0
score_hash.sort_by{|key,value| -key}.each do |key,value|
	max = key
	break;
end

# 最大値までの三角数を算出し、三角語の出現回数をカウント
sum = 0
traingular = 0
i = 1
while traingular <= max
	traingular = (i + 1) * i / 2
	sum += score_hash[traingular] if score_hash[traingular]
	i += 1
end

p sum
