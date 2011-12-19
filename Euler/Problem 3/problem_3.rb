#!/usr/bin/env ruby

# The algorithm I have here was admittedly taken from the follwoing answer
# on StackOverflow: http://stackoverflow.com/a/412942/89342 
#
# This algorithm works by taking a natural number and a divisor variable
# starts at 2. The magic of the algorithm is that while we are increasing
# the value of the divisor variable, whenever it is a factor of num, we
# track the value and divide num. So although we may have a large num,
# the its internal valur in prime_factors gets decreased pretty fast. Also,
# only the prime factors are used in this division because the first numbers
# to begin the division of num will be prime - and all natural numbers can be
# factored into a set of prime numbers.
#
# However, this means that the algorithm's performance is not determined
# by num, but rather the value of its highest prime factor. This can be made faster
# by taking advantage of the knowledge that all numbers n can have at most one
# prime factor greater than the sqrt(n).
#

TARGET = 600851475143

def prime_factors(num)
  factors = []
  
  divisor = 2

  while num > 1
    
    while num % divisor == 0
      factors.push(divisor)
      num /= divisor 
    end

    divisor = divisor + 1
  
  end

  return factors
end

p prime_factors(TARGET)
