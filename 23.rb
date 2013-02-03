# 約数の和を求める
def get_divisora(num)
        sum = 0
        for i in 1..Math::sqrt(num)
                # 約数
                if num % i == 0
                        j = num / i
                        sum += i
                        sum += j if i != j
                end
        end

        sum -= num
        return sum
end

kajou_list = []

for num in 1..28123
	divi = get_divisora(num)
	if num < divi
		kajou_list << num
	end
end

kajou_wa_hash = {}

kajou_list.each do |num1|
	kajou_list.each do |num2|
		kajou_wa_hash[num1 + num2] = true
	end
end

sum = 0
for i in 1..28123
	if !kajou_wa_hash[i]
		sum += i
	end
end

p sum
