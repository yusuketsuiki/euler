def getc(num)
	j = 0;
	while num != 1
		if num % 2 == 0
			num = num / 2 
		else
			num = num * 3 + 1
		end
		j += 1	
	end
	return j
end


clist = {}
for i in 1..1000000
	p i
	clist[i] =  getc(i)
end

clist.sort_by{|key, value| value}.each do|key, value|
	p "key:" + key.to_s() + " value:" +  value.to_s()
end
