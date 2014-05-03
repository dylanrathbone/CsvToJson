require 'spec_helper'
require 'FileTransformer'
require 'stringio'
require 'csv'

describe FileTransformer do

  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  context 'valid file' do

    before(:each) do
      FileTransformer.new 'test_data.csv'
    end

    it 'should notify the user that the file has been read in' do
      expect($stdout.string).to match("Loading file test_data.csv...")
    end

    it 'should notify the user when a valid file name has been provided' do
      expect($stdout.string).to match("File loaded successfully")
    end

    it 'should convert the csv to JSON' do
      json_generator = FileTransformer.new 'test_data.csv'
      expect(json_generator.generated_json).to eq("[\n  {\n    \"item_id\": 111010,\n    \"description\": \"Coffee\",\n    \"price\": \"$1.25\"\n  }\n]")
    end

    it 'should notify the user that the conversion is complete' do
      expect($stdout.string).to match("JSON document successfully generated from file test_data.csv")
    end

  end

  context 'invalid file' do

    it 'should notify the user when a file name without the ".csv" extension has been provided' do
      FileTransformer.new 'invalid_file_name'
      expect($stdout.string).to match("Filename entered is not of a valid")
    end

    it 'should notify the user when a file name has not been provided' do
      FileTransformer.new ''
      expect($stdout.string).to match("Filename entered is not of a valid")
    end

    it 'should notify the user if the file specified does not exist' do
      FileTransformer.new 'dylan.csv'
      expect($stdout.string).to match("File specified does not exist")
    end

  end

end
