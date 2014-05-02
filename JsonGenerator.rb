require 'csv'
require 'helpers/UserMessages'
require 'json'

class JsonGenerator

  attr_accessor :filename
  attr_accessor :file_data
  attr_accessor :generated_json

  CSV_FILE_EXTENSION = '.csv'

  def initialize(filename)
    @filename = filename
    generate
  end

  private
  def generate
    if valid_filename_format? and file_exists? then load_file and generate_json end
  end

  def valid_filename_format?
    if @filename.end_with?("#{CSV_FILE_EXTENSION}")
      return true
    else
      puts "#{UserMessages::ErrorMessages::INVALID_FILE_FORMAT}"
    end
  end

  def file_exists?
    if File.exist?(@filename)
      return true
    else
      puts "#{UserMessages::ErrorMessages::FILE_DOES_NOT_EXIST}"
    end
  end

  def load_file
    puts "#{UserMessages::GeneralMessages::LOADING_FILE} #{@filename.to_s}..."
    @file_data = CSV.new(File.open(@filename), :headers => true, :header_converters => :symbol, :converters => :all)
    puts "#{UserMessages::GeneralMessages::FILE_IMPORT_SUCCESS}"
    return true
  end

  def generate_json
    @generated_json = JSON.pretty_generate(@file_data.to_a.map { |row| row.to_hash })
    puts "#{UserMessages::GeneralMessages::JSON_GENERATED} #{@filename}\n\n#{@generated_json}"
  end

end
