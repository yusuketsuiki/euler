i = 0
cnt = 0

for year in 1900..2000
	for month in 1..12
		p "year:" + year.to_s() + " month:" + month.to_s()
		if i % 7 == 6 && year >= 1901
			cnt += 1
		end

		if month == 2
			if year % 400 == 0
				i += 29
			elsif year % 100 == 0
				i += 28
			elsif year % 4 == 0
				i += 29
			else
				i += 28
			end
		elsif month == 4 || month == 6 || month == 9 || month == 11
			i += 30
		else
			i += 31
		end
	end
end

p cnt
