#!/usr/bin/ruby

require 'JsonGenerator'

input_file = ARGV[0]

if input_file.nil?
  puts "usage: convert.rb <file to convert>"
else
  JsonGenerator.new input_file
end



