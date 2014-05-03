require 'csv'
require 'helpers/UserMessages'

class XMLGenerator

  attr_accessor :file_name

  def initialize(filename)
    @file_name = filename
  end

  def generate
    puts "XML Data"
  end

end