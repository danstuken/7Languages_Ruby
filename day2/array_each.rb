#!/usr/bin/ruby
#
# Dan Kendall 06/2011
#
#Exercises with arrays
#

module SlicePrint

   def put_slice(block_size)
      count = 0;
      each do |element|
         print "#{element}"
         count += 1  ##am i forming a closure here? do I need to be careful of anything?
         puts if count % block_size == 0
      end
   end

   def put_slice(options = {})
      options[:block_size] = 4 if options[:block_size] == nil
      options[:operation] = do |slice|
         puts slice.join(' ')
      end if options[:operation] == nil
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
