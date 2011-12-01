#!/usr/bin/env ruby

# In this problem, we are trying to compute the sum of all the even
# Fibonacci terms that are less than 4,000,000.
#
# To do this, we first need to look at the fibonacci terms:
#
# 1 1 2 3 5 8 13 21 34 55 89 144 ...
# 
# Looking at those terms, we notice that every 3rd term is even.
# 
# Considering this, we can now use the closed form equation [1] to first 
# find the fibonacci term for a given index. Once we have this working,
# we can then use one of the series' identities to deterine the value
# for every third term [2]. (I use the second equation to avoid having an
# extra condition in the loop to check for index % 3 == 0).
#
# Now that we can easily determine all the even values of the fibonacci terms,
# we can then just sum all the values under a given limit.
# 
# My one problem with this solution is that I was unable (as of 11/30/2011) to determine
# a closed form summation formula for the even fibonacci terms.
#
# Now that we can easily compute the
# -------------------------------
# [1] http://en.wikipedia.org/wiki/Fibonacci_number#Computation_by_rounding
# [2] http://en.wikipedia.org/wiki/Fibonacci_number#Other_identities
#
GOLDEN_RATIO = 1.6180339887
SQRT_FIVE = Math.sqrt(5)

def fibonacci_num_at_index(index)
  return ( (GOLDEN_RATIO**index)/SQRT_FIVE + 0.5 ).floor
end

def fibonacci_num_at_3n(index)
  fib_num = fibonacci_num_at_index(index)
  return ( 5 * ( fib_num**3 ) ) + ( 3 * (-1)**index * fib_num ) 
end

limit = 4000000
sum = 0

(1..100).each do |n|
  val = fibonacci_num_at_3n(n)
  
  if val >= limit
    break
  end
  
  sum += val
end

p sum