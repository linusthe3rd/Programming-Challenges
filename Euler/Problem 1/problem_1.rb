#!/usr/bin/env ruby

sum = 0 

(0..999).each do |n|
  if (n % 3 == 0) or (n % 5 == 0)
    sum += n
  end
end

p sum