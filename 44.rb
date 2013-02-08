gokaku_hash = {}

i = 4
j = 1
num = 1

gokaku_hash = {}
while 1
	gokaku_hash[num] = j

	# 判定
	if num > 100000000
		gokaku_hash.each do |num1,j1|
			gokaku_hash.each do |num2,j2|
				break if num1 < num2
				p "num1:" + num1.to_s() + " num2:" + num2.to_s() + " j1:" + j1.to_s() + " j2:" + j2.to_s() + " minus:" + (num1 - num2).to_s()
				if gokaku_hash[num1 + num2] && gokaku_hash[num1 - num2]
					exit
				end
			end
		end
	end

	p num

	num += i
	i += 3
	j += 1
end
