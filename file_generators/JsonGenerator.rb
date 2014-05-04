require 'ApplicationHelper'
require 'json'

class JsonGenerator

  include FileHelper
  include UserMessages

  attr_accessor :file_name
  attr_accessor :generated_json

  def initialize(filename)
    @file_name = filename
  end

  def transform_file
    if valid_filename_format? and file_exists? then generate_json end
  end

  private
  def generate_json
    @generated_json = JSON.pretty_generate(load_file.to_a.map { |row| row.to_hash })
    puts "#{UserMessages::GeneralMessages::JSON_GENERATED} #{@file_name}\n\n#{@generated_json}"
  end

end
