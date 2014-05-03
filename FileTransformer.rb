require 'csv'

class FileTransformer

  attr_accessor :generator

  def initialize(generator)
    @generator = generator
    transform
  end

  def transform
    @generator.transform_file
  end

end
