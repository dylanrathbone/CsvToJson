require 'ApplicationHelper'

class XMLGenerator

  include FileHelper

  attr_accessor :file_name

  def initialize(filename)
    @file_name = filename
  end

  def transform_file
    if valid_filename_format? and file_exists? then generate_xml end
  end

  private
  def generate_xml
    puts 'Pending implementation.. XML Data would be printed here...'
  end

end