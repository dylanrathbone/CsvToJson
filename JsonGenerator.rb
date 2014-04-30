require 'csv'
require 'json'

class JsonGenerator

  attr_accessor :filename
  attr_accessor :generated_json

  def initialize filename
    @filename = filename
    prompt_and_read_file
  end

  def prompt_and_read_file
    check_filename_format
  end

  private
  def check_filename_format
    if @filename.end_with?(".csv")
      puts "File import successfull."
      read_and_load
    else
      puts "Filename entered is not of a valid format!"
    end
  end

  def read_and_load
    if File.exist?(@filename)
      puts "Loading file: #{@filename.to_s}..."
      load_and_generate
    else
      puts "File specified does not exist!"
    end
  end

  def load_and_generate
    csv = CSV.new(File.open(@filename), :headers => true, :header_converters => :symbol, :converters => :all)
    @generated_json = JSON.pretty_generate(csv.to_a.map {|row| row.to_hash })
    puts "JSON document successfully generated from file: #{@filename}"
  end

end
