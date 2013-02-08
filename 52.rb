def is_answer(num1,num2)
	flg = true
	for i in 0..9
		if num1.to_s().scan(/#{i}/).size() != num2.to_s().scan(/#{i}/).size()
			flg = false
			break
		end
	end

	return flg
end

# main
i = 1
while 1
	if is_answer(i,i * 6) && is_answer(i, i * 5) && is_answer(i, i * 4) && is_answer(i, i * 3) && is_answer(i, i * 2) 
		p "ok -- " + i.to_s()
		break
	else
		p "ng -- " + i.to_s()
	end

	i += 1
end
