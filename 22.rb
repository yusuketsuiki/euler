def get_score(name)
	alfa_hash = {"A" => 1, "B" => 2, "C" => 3, "D" => 4, "E" => 5, "F" => 6, "G" => 7, "H" => 8, "I" => 9, "J" => 10, "K" => 11, "L" => 12, "M" => 13, "N" => 14, "O" => 15, "P" => 16, "Q" => 17, "R" => 18, "S" => 19, "T" => 20, "U" => 21, "V" => 22, "W" => 23, "X" => 24, "Y" => 25, "Z" => 26}
	score = 0
	alfa_hash.each do |key,value|
		score += name.scan(/#{key}/).size() * value
	end

	return score
end

names = []
fp = open("n22.txt")
fp.each do |line|
	line = line.gsub('"',"")
	names = line.split(",")
end

sum = 0
i = 1
names.sort.each do |name|
	sum += (i * get_score(name))

	if name == "COLIN"
		
		p (i * get_score(name))
	end

	i += 1
end

p sum
