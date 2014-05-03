require 'csv'
require 'helpers/UserMessages'

class XMLGenerator

  attr_accessor :file_name

  def initialize(filename)
    @file_name = filename
  end

  def transform_file
    puts "XML Data"
  end

end