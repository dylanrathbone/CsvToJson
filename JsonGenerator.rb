require 'csv'
require 'json'

class JsonGenerator

  attr_accessor :filename
  attr_accessor :generated_json

  def initialize filename
    @filename = filename
    generate
  end

  def generate
    if valid_filename_format? then
      if file_exists? then
          load_csv
      else
        puts "File specified does not exist!"
      end
    else
      puts "Filename entered is not of a valid format!"
    end
  end

  private
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
    csv = CSV.new(File.open(@filename), :headers => true, :header_converters => :symbol, :converters => :all)
    puts "File import successfull."
    generate_json(csv)
  end

  def generate_json csv
    @generated_json = JSON.pretty_generate(csv.to_a.map { |row| row.to_hash })
    puts "JSON document successfully generated from file: #{@filename}\n\n#{@generated_json}"
  end

end
