#!/usr/bin/ruby

require 'FileTransformer'
require 'JsonGenerator'
require 'XMLGenerator'

input_file = ARGV[0]
desired_format = ARGV[1]

if input_file.nil? || desired_format.nil?
  puts "usage: convert_to_json.rb <file to convert>, <desired format>"
else

  case desired_format
    when 'json'
      FileTransformer.new(JsonGenerator.new(input_file))
    when 'xml'
      FileTransformer.new(XMLGenerator.new(input_file))
  end

end



