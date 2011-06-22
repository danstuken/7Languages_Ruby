#!/usr/bin/ruby

module ActsAsCsv
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    
    def prepare
      @filename = self.class.to_s.downcase + '.txt'
      File.open(@filename) do |csv_file|
         @headers = csv_file.gets.chomp.split(', ')
      end
    end

    def _read_headers
    end

    def each
       File.open(@filename) do |csv_file|
          csv_file.gets #skip headers
          csv_file.each do |row|
             yield CsvRow.new(@headers, row.chomp.split(', '))
          end
       end
    end
    
    attr_accessor :headers
    attr :filename
    
    def initialize
      prepare 
    end

  end

end

class CsvRow

   attr :row_data

   def initialize(headers, row)
      @row_data = {}
      
      i = 0
      headers.each do |header| 
         @row_data[header] = row[i]
         i += 1
      end
   end

   def method_missing name, *args
      @row_data[name.to_s] 
   end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
m.each do |csvrow|
   puts "one: #{csvrow.one}"
   puts "two: #{csvrow.two}"
   puts "three: #{csvrow.three}"
end
