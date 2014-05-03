#!/usr/bin/ruby

require 'FileTransformer'
require 'helpers/UserMessages'
require 'file_generators/JsonGenerator'
require 'file_generators/XMLGenerator'

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
  end

end



