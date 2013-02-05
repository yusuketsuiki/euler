# 五角数か
def is_gokaku_num(num,gcnt)
	while num >= (gcnt.call(0) * (3 * gcnt.call(0) - 1) / 2)
		gokaku_num = gcnt.call(0) * (3 * gcnt.call(0) - 1) / 2
		return gokaku_num if gokaku_num == num

		gcnt.call(1)
	end
	
	gcnt.call(-1)
	return nil
end

# 六角数か
def is_rokkaku_num(num,rcnt)
        while num >= (rcnt.call(0) * (2 * rcnt.call(0) - 1))
                rokkaku_num = rcnt.call(0) * (2 * rcnt.call(0) - 1) 
                return rokkaku_num if rokkaku_num == num

		rcnt.call(1)
        end
	rcnt.call(-1)
        return nil
end

# 五角数、六角数の判定にはクロージャを用いる
def get_gokaku_count
        count = 0
        f = lambda{|n| count += n}
        return f
end

def get_rokkaku_count
        count = 0
        f = lambda{|n| count += n}
        return f
end


# 三角数をwhileで回す
i = 1
j =0 
gcnt = get_gokaku_count
rcnt = get_rokkaku_count

while 1
	sankaku_num =  i * (i + 1) / 2
	gokaku_num = is_gokaku_num(sankaku_num,gcnt)
	rokkaku_num = is_rokkaku_num(sankaku_num,rcnt)

	i += 1

	# 五角形
	if gokaku_num && rokkaku_num
		p sankaku_num
		j += 1

		break if j == 3
	end
end
