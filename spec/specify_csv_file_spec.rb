require 'spec_helper'
require 'JsonGenerator'
require 'stringio'

describe JsonGenerator do

  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  context 'valid file' do

    it 'should notify the user when a valid file name has been provided' do
      JsonGenerator.new 'stock_data.csv'
      expect($stdout.string).to match('File import successfull.')
    end

    it 'should read the file from disk' do
      json_generator = JsonGenerator.new 'stock_data.csv'
      file_contents = json_generator.file_contents.to_s
      file_contents.should_not be_empty
    end

    it 'should notify the user that the file has been read in' do
      JsonGenerator.new 'stock_data.csv'
      expect($stdout.string).to match("Loaded file: stock_data.csv")
    end

  end

  context 'invalid file' do

    it 'should notify the user when a file name without the ".csv" extension has been provided' do
      JsonGenerator.new 'invalid_file_name'
      expect($stdout.string).to match("Filename entered is not of a valid format!")
    end

    it 'should notify the user if the file specified does not exist' do
      JsonGenerator.new 'dylan.csv'
      expect($stdout.string).to match("File specified does not exist!")
    end

  end

end
