#!/usr/bin/env ruby

# There were two components to this problem:
#
# 1. Determine if a number is palindromic
# 2. Determine the lasrgest palindromic that is the product of two 3-digit integers
#
# For 1, I tried exploring bitwise operations, but this turned out to be too hard
# to do in Ruby since it doesn't seem good at interacting with ints at the bit level 
# (at least from what I found).
#
# For 2, since we know we are looking for the largest palindromic number, we can save
# time by starting the factors at 999. We then just iterate over every possible digit
# and check if their products are palindromes. This algorithm is generally the fastest 
# algorithm for the problem.
#
# However, from the solution sheet, we CAN make the alogrithm faster for this 
# specific problem by reducing the set of numbers we need to evaluate. In the solution
# we learn that num1 or num2 MUST be a factor of 11 for the palindromic products
# to occur. This significantly reduces the set of factors we evaluate, but still
# keeps the O(n^2) performance.
#
#

def reverse_digits(num)
  revnum = 0
  
  while num != 0
    revnum = revnum*10 + (num % 10)
    num /= 10
  end

  return revnum 
end

def is_palindrome(num)
  return num == reverse_digits(num)
end

num1=999
num2=999
result = 0

while num1 > 99

  while num2 > 99
    x = num1*num2
    if is_palindrome(x) and x > result
      result = x
      break
    end
    num2-=1
  end

  num1-=1
  num2=999

end

p result
