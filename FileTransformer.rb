require 'csv'
require 'helpers/UserMessages'

class FileTransformer

  attr_accessor :format

  def initialize(format)
    @format = format
    transform
  end

  def transform
    @format.generate
  end

end
