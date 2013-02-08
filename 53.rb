def get_sum(n,r)
	sum = get_kaijou(n) / (get_kaijou(r) * get_kaijou(n - r))
end

def get_kaijou(num)
	sum = 1;
	for i in 1..num
		sum = sum * i
	end

	return sum
end

sum = 0
for n in 1..100
	for r in 1..100
		break if n < r
		num = get_sum(n,r)
		p "n:" + n.to_s() + " r:" + r.to_s() + " num:" + num.to_s()
		sum += 1 if num > 1000000
	end
end

p sum
