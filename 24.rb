# 再帰的呼び出しパンディジタルな数字を生成
def get_pandigital(list,numstr,cnt)
	
	list.each do |i|
		nowstr = numstr

		# 同じ数字がある時は飛ばす
		#p "i:" + i.to_s() + " now:" + nowstr
		if /#{i}/ !~ nowstr
			nowstr += i.to_s()

			if nowstr.length < list.size
				get_pandigital(list,nowstr,cnt)
			else
				nowcnt = cnt.call(1)
				p "cnt:" + nowcnt.to_s() + " num:" + nowstr
				
				exit if nowcnt == 1000000
			end
		end
	end
end

# カウントはクロージャで実装
def get_count
	count = 0
	f = lambda{|n| count += n}
	return f
end


cnt = get_count
list = [0,1,2,3,4,5,6,7,8,9]
get_pandigital(list,"",cnt)
