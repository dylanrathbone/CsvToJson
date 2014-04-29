require 'csv'

class JsonGenerator

  attr_accessor :filename
  attr_accessor :csv_data

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

      load_csv_data

      puts "Loaded file: #{@filename.to_s}."
    else
      puts "File specified does not exist!"
    end
  end

  def load_csv_data
    file = File.open(@filename)
    csv_data = file.read
    file.close
    @csv_data = CSV.new(csv_data).to_a
  end

end
