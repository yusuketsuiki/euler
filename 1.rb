sum = 0
for n in 1..999
  sum += n if n % 3 == 0 or n % 5 == 0
end

p sum
