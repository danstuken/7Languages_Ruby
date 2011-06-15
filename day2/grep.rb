#!/usr/bin/ruby
#
# Dan Kendall 06/2011
#
# grep.rb
#

module Grep
   def grep(match)
      line_count = 1
      each do |line|
         yield({:line_no => line_count, :text => line}) if line =~ Regexp.new(match)
         line_count += 1
      end
   end
end

class File
   include Grep
end

def grep_file(filename, match)
   File.open(filename) do |file|
      file.grep(match) { |match| puts "#{match[:line_no]} #{match[:text]}" }
   end
end

grep_file('my_datafile', 'the') 
