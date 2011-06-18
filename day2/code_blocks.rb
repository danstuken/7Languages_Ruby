#!/usr/bin/ruby

def one_to_ten
   i = 1
   while i <= 10
      yield i
      i += 1
   end
end

one_to_ten {|x| puts x}

y = 1 
one_to_ten do |x|
  y *= x 
end
puts y
