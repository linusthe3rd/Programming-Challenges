#!/usr/bin/env ruby

# So my solution below is ok, but takes way too long since the loop
# must run over 11 million times before finding a solution. 
#
# The faster algorithm is actually really cool since we know from problem
# 3 that all natural numbers can be broken down into a factorization of 
# primes. Since a single prime can occur a few times in a facorization, 
# we can also take advantage of some exponent math. 
#
# Considering this, let N be the number we are seraching for and k=20 (the
# max number in our factor range). So since N will be a combination of 
# primes, we can disregard all factors that are not prime (like 4, 6, 9, etc.).
# Also, since we know a prime can occur a few times, a prime will have an exponent, 
# P. To find P, we must find the largest P that is <= k. For example:
#
# * P=4: 2^4=16
# * P=5: 2^5=32
#
# Therefore, P=4 and no N can have more than four prime factors of 2 to be 
# valid for our factor range. 
#
# To save time on determining what P can be, we san simplify the equation:
#
# f^P=k -> P = FLOOR[ log(k) / log(f) ]
#
# Combining this knowledge with the prime factorization in problem 3 ends up giving
# us a pretty interesting solution!
#

# We don't need to check if a number is divisible by
# 1, 2, 4, 5, 10, or 20 because our intervals increase by
# 20 each time.
FACTORS = [3,6,7,8,9,11,12,13,14,15,16,17,18,19]

# Since we already know that 2520 is the smallest number
# divisible by 1-10 and is also divisible 20, we can start
# looking for numbers here. 
base=126

def is_divisible(num)
  FACTORS.each do |factor|
    if num % factor != 0
      return false
     end
  end

  return true
end

while base < 100000000

  product = base*20

  if is_divisible(product)
    p product
    break
  end

  base+=1
end
