require 'spec_helper'
require 'stringio'

describe XMLGenerator do

  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  context 'valid file' do

    let(:xml_generator) { XMLGenerator.new('test_data.csv') }

    it 'should simulate xml conversion has taken place by printing an appropriate message' do
      xml_generator.transform_file
      expect(xml_generator.generated_xml).to eq("Pending implementation.. XML Data would be printed here...")
    end

  end

  context 'invalid file' do

    it 'should notify the user when a file name without the ".csv" extension has been provided' do
      xml_generator = XMLGenerator.new('test_data')
      xml_generator.transform_file
      expect($stdout.string).to match("Filename entered is not of a valid type")
    end

    it 'should notify the user when a file name has not been provided' do
      xml_generator = XMLGenerator.new('')
      xml_generator.transform_file
      expect($stdout.string).to match("Filename entered is not of a valid type")
    end

    it 'should notify the user if the file specified does not exist' do
      xml_generator = XMLGenerator.new('dylan.csv')
      xml_generator.transform_file
      expect($stdout.string).to match("File specified does not exist")
    end

  end

end
