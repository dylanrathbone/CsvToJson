require 'spec_helper'
require 'JsonGenerator'
require 'stringio'

describe JsonGenerator do

  before do
    $stdout = StringIO.new
  end

  before(:each) do
    csv_converter = JsonGenerator.new
    csv_converter.generate
  end

  after(:all) do
    $stdout = STDOUT
  end

  it 'should ask for ask the user to enter the name of a csv file' do
    expect($stdout.string).to match(/Please enter the name of a file to jsonify: /)
  end


  it 'should notify the user when a invalid file name has been entered' do
    csv_converter = JsonGenerator.new
    csv_converter.file_name = 'Filename_Without_CSV_extension.csv'
    expect($stdout.string).to match(/Filename entered is not of a valid format!/)
  end

end
