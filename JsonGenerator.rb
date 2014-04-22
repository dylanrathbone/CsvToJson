class JsonGenerator

  attr_accessor :file_name

  def generate
    provide_file_name_and_read_it_in
  end

  def provide_file_name_and_read_it_in
    print "Please enter the name of a file to jsonify: "
    if (gets.chomp.end_with?(".csv"))
      file_name = gets.chomp
    else
      print "Filename entered is not of a valid format!"
    end

  end

end
