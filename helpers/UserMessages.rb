module UserMessages

  module ErrorMessages
    FILE_DOES_NOT_EXIST = 'File specified does not exist'
    INVALID_FILE_FORMAT = 'Filename entered is not of a valid type'
  end

  module GeneralMessages
    JSON_GENERATED = 'JSON document successfully generated from file'
    LOADING_FILE = 'Loading file'
    USAGE = 'usage: convert.rb <file_to_convert>, <desired file format>'
    VALID_FILE_FORMAT = 'Please ensure that you provide a valid file format i.e. JSON, XML, YAML'
  end

end