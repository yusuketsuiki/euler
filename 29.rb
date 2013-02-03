hash = {}
for i in 2..100
	for j in 2..100
		num = i**j
		if !hash[num]
			hash[num] = true
		end
	end
end
p hash.size()
