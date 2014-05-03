require 'helpers/FileHelper'
require 'helpers/UserMessages'

class XMLGenerator

  include FileHelper

  attr_accessor :file_name

  def initialize(filename)
    @file_name = filename
  end

  def transform_file
    if valid_filename_format? and file_exists? then generate_xml end
  end

  def generate_xml
    puts 'XML Data'
  end

end