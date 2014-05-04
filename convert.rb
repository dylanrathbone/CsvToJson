#!/usr/bin/ruby

require 'FileTransformer'
require 'ApplicationHelper'

input_file = ARGV[0]
desired_format = ARGV[1]

if input_file.nil? || desired_format.nil?
  puts "#{UserMessages::GeneralMessages::USAGE}"
else

  case desired_format
    when 'json'
      FileTransformer.new(JsonGenerator.new(input_file))
    when 'xml'
      FileTransformer.new(XMLGenerator.new(input_file))
    else
      puts "#{UserMessages::GeneralMessages::VALID_FILE_FORMAT}"
  end

end



