require 'spec_helper'
require 'file_generators/JsonGenerator'
require 'stringio'

describe JsonGenerator do

  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  context 'valid file' do

    let(:json_generator) { JsonGenerator.new('test_data.csv') }

    it 'should notify the user that the file has been read in' do
      json_generator.transform_file
      expect($stdout.string).to match("Loading file test_data.csv...")
    end

    it 'should convert the csv to JSON' do
      json_generator.transform_file
      expect(json_generator.generated_json).to eq("[\n  {\n    \"item_id\": 111010,\n    \"description\": \"Coffee\",\n    \"price\": \"$1.25\"\n  }\n]")
    end

    it 'should notify the user that the conversion is complete' do
      json_generator.transform_file
      expect($stdout.string).to match("JSON document successfully generated from file test_data.csv")
    end

  end

  context 'invalid file' do

    it 'should notify the user when a file name without the ".csv" extension has been provided' do
      json_generator = JsonGenerator.new('test_data')
      json_generator.transform_file
      expect($stdout.string).to match("Filename entered is not of a valid type")
    end

    it 'should notify the user when a file name has not been provided' do
      json_generator = JsonGenerator.new('')
      json_generator.transform_file
      expect($stdout.string).to match("Filename entered is not of a valid type")
    end

    it 'should notify the user if the file specified does not exist' do
      json_generator = JsonGenerator.new('dylan.csv')
      json_generator.transform_file
      expect($stdout.string).to match("File specified does not exist")
    end

  end

end
