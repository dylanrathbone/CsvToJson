class JsonGenerator

  attr_accessor :filename
  attr_accessor :file_contents

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
      read_in_file
    else
      puts "Filename entered is not of a valid format!"
    end
  end

  def read_in_file
    if File.exist?(@filename)
      @file_contents = File.open(@filename)
      puts "Loaded file: #{@filename.to_s}."
    else
      puts "File specified does not exist!"
    end

  end

end
