require 'csv'
require 'json'
require 'helpers/UserMessages'

class JsonGenerator

  attr_accessor :filename
  attr_accessor :generated_json

  def initialize filename
    @filename = filename
    generate
  end

  private
  def generate
    if valid_filename_format?
      if file_exists?
          load_csv
      else
        puts "#{UserMessages::ErrorMessages::FILE_DOES_NOT_EXIST}"
      end
    else
      puts "#{UserMessages::ErrorMessages::INVALID_FILE_FORMAT}"
    end
  end

  def valid_filename_format?
    @filename.end_with?(".csv")
  end

  def file_exists?
    if File.exist?(@filename)
      puts "#{UserMessages::GeneralMessages::LOADING_FILE} #{@filename.to_s}..."
      return true
    end
  end

  def load_csv
    csv_data = CSV.new(File.open(@filename), :headers => true, :header_converters => :symbol, :converters => :all)
    puts "#{UserMessages::GeneralMessages::FILE_IMPORT_SUCCESS}"
    generate_json(csv_data)
  end

  def generate_json csv
    @generated_json = JSON.pretty_generate(csv.to_a.map { |row| row.to_hash })
    puts "#{UserMessages::GeneralMessages::JSON_GENERATED} #{@filename}\n\n#{@generated_json}"
  end

end
