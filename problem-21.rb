# Let d(n) be defined as the sum of proper divisors of n (numbers less 
# than n which divide evenly into n).
#
# If d(a) = b and d(b) = a, where a  b, then a and b are an amicable 
# pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 
# 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 
# are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

divisors = Hash.new do |h, k|
  h[k] = [1]
  2.upto(Math.sqrt(k).to_i) do |d|
    h[k].push(d, k/d) if (k % d).zero?
  end
  h[k]
end

result = []
2.upto(10000) do |num|
  sum1 = divisors[num].inject(&:+)
  sum2 = divisors[sum1].inject(&:+)
  result |= [num, sum1] if num != sum1 && num == sum2
end

puts result.inject(&:+)
