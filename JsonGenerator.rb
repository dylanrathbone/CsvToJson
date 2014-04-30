require 'csv'
require 'json'

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
        puts "File specified does not exist!"
      end
    else
      puts "Filename entered is not of a valid format!"
    end
  end

  def valid_filename_format?
    @filename.end_with?(".csv")
  end

  def file_exists?
    if File.exist?(@filename)
      puts "Loading file: #{@filename.to_s}..."
      return true
    end
  end

  def load_csv
    csv_data = CSV.new(File.open(@filename), :headers => true, :header_converters => :symbol, :converters => :all)
    puts "File import successfull."
    generate_json(csv_data)
  end

  def generate_json csv
    @generated_json = JSON.pretty_generate(csv.to_a.map { |row| row.to_hash })
    puts "JSON document successfully generated from file: #{@filename}\n\n#{@generated_json}"
  end

end
