#!/usr/bin/env ruby

# Slow Solution - O(n)
# --------------------
# This solution is great for low numbers, but is slooooooow
# for a number like 1,000,000,000.
#
sum = 0 

(0..999).each do |n|
  if (n % 3 == 0) or (n % 5 == 0)
    sum += n
  end
end

p sum

# Fast Solution [1] - O(1)
# --------------------
# We are really just doing a summation here, so we should actually take advantage
# of those well known summation formulas we learned in school!
#
# For example, the summation of all numbers < 1000 that are divisible by 3 is:
#
#   3+6+9+...+999 = 3 * (1+2+3+...+333)
#
# We did the equation on the left in the "Slow Solution", but the equation on the
# right is a normal 1 to n summation[2]:
#
# 3*Sum(1..n) = 3 * ([n^2 + n]/2) = 3 * [(1/2)*n*(n+1)]
#
# So now our loop, which executes N times, executes once and just computes a formula
# (something computers are really good at).
#
# -----------------
# [1] http://projecteuler.net/project/resources/001_c619a145e9d327a5c4c84649bec9981b/001_overview.pdf
# [2] http://en.wikipedia.org/wiki/Summation
TARGET = 999999999

def sum_divisible_by(div)
  n = TARGET / div
  return div * ( (0.5)*n*(n+1) )
end

puts sum_divisible_by(3) + sum_divisible_by(5) - sum_divisible_by(15)

