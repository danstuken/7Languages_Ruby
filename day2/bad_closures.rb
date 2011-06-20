#!/usr/bin/ruby
#
#bad_closures.rb
#
#Dan Kendall 06/2011
#

def bad_closure_list
   my_number_multiplier_list = []
   i = 0
   while i < 10
      my_number_multiplier_list.push lambda {|x| i * x}
      i += 1
   end
   return my_number_multiplier_list 
end

def do_something_with_bad_closures(closure_list)
  closure_list.each do |closure|
     num = closure.call(1)
     puts num
  end
end

do_something_with_bad_closures(bad_closure_list)
