# a^2 + b^2 = c^2となるような数字にいくつ分割できるかを判定
def get_right_triangle_number(num)
	sum = 0

	# 直角三角形において、長辺の長さは「Math::sqrt(2) / 1 + 1 + Math::sqrt(2)」以上、1/2未満
	total = 1 + 1 + Math::sqrt(2)

	c_min = (num / total * Math::sqrt(2)).ceil	# 長辺の下限を求めているので切り上げ
	c_max = (num / 2).truncate  # 長辺の上限を求めているので切り捨て

	# 直角三角形において、短辺の長さは1以上、1 / 2 + Math::sqrt(2)以下
	a_min = 1
	a_max = (num / total).truncate  # 上限を求めているので切り捨て

	# a,b,cの組み合わせがピタゴラスの定理を形成するかを判定
	for c in c_min..c_max
		for a in a_min..a_max
			b = num - c - a
			break if b < a

			if (a**2 + b**2) == c**2
				p "num:" + num.to_s() +  "a:" + a.to_s() + " b:" + b.to_s() + " c:" + c.to_s()
				sum += 1
			end
		end
	end

	return sum
end

answer = 0
max = 0
for num in 4..1000
	triangre_number = get_right_triangle_number(num)
	if triangre_number > max
		max = triangre_number
		answer = num
	end
end

p answer
