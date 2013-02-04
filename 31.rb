def get_answer(coin_list,array_num,limit,num,coin_hash,cnt)
	for i in 0..limit/coin_list[array_num]
		now_hash = coin_hash
		nownum = num

		nownum += (coin_list[array_num] * i)
		now_hash[coin_list[array_num]] = i


		if nownum == limit
			cnt.call(1)
			p now_hash
		elsif nownum < limit
			if array_num < (coin_list.size() - 1)
				get_answer(coin_list,array_num + 1,limit,nownum,now_hash,cnt)
			end
		else
			coin_hash[coin_list[array_num]] = 0
			return nil
		end
	end

	coin_hash[coin_list[array_num]] = 0
end

# カウントはクロージャを使って集計
def get_count
        count = 0
        f = lambda{|n| count += n}
        return f
end


cnt = get_count
coin_list = [200,100,50,20,10,5,2,1]
coin_hash = {}
limit = 200

get_answer(coin_list,0,limit,0,coin_hash,cnt)

p cnt.call(0)
