module FileHelper

  CSV_FILE_EXTENSION = '.csv'

  def valid_filename_format?
    if file_name.end_with?("#{CSV_FILE_EXTENSION}")
      return true
    else
      puts "#{UserMessages::ErrorMessages::INVALID_FILE_FORMAT}"
    end
  end

  def file_exists?
    if File.exist?(file_name)
      return true
    else
      puts "#{UserMessages::ErrorMessages::FILE_DOES_NOT_EXIST}"
    end
  end

  def load_file
    puts "#{UserMessages::GeneralMessages::LOADING_FILE} #{file_name.to_s}..."
    begin
      CSV.new(File.read(file_name), :headers => true, :header_converters => :symbol, :converters => :all)
    rescue IOError => io_error
      puts "There was a problem when trying to read the file: #{file_name}" + io_error.to_s
    end
  end
end
