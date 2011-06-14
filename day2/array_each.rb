#!/usr/bin/ruby
#
# Dan Kendall 06/2011
#
#Exercises with arrays
#

module SlicePrint

   def put_slice(slice_size)
      count = 0;
      each do |element|
         print "#{element}"
         count += 1  ##am i forming a closure here? do I need to be careful of anything?
         puts if count % slice_size == 0
      end
   end

   def slice_op(slice_size)
      slice = []
      each do |element|
         slice.push element
         if slice.count == slice_size 
            yield slice
            slice = []
         end
      end
   end

end

class Array
   include SlicePrint
end

source_array = (1..16).to_a

puts "Firstly..."
source_array.each {|element| puts element}

puts
puts "Secondly"
source_array.put_slice 4
puts

puts "Thirdly"
source_array.put_slice 5
puts

puts
puts "Fourthly"
source_array.slice_op(4) { |slice| puts slice.join(' ') }
puts
