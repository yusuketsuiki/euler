str = ""
i = 1

while str.length() <= 1000000
	str = str + i.to_s()
	i += 1

	p str.length()
end

p str[(1-1),1].to_i() * str[(10-1),1].to_i() * str[(100-1),1].to_i() * str[(1000-1),1].to_i() * str[(10000-1),1].to_i() * str[(100000-1),1].to_i() * str[(1000000-1),1].to_i();
