require 'ApplicationHelper'
require 'json'

class JsonGenerator

  include FileHelper
  include JsonGeneratorHelper
  include UserMessages

  attr_accessor :file_name
  attr_accessor :generated_json

  def initialize(filename)
    @file_name = filename
  end

  def transform_file
    if valid_filename_format? and file_exists? then generate_json end
  end

  private
  def generate_json

    csv_as_array_of_hashes = load_file.to_a.map { |row| row.to_hash}
    formatted_csv_data = Array.new
    temporary_array_of_hashes = Array.new

    csv_as_array_of_hashes.each_with_index {
        |csv_array_element, csv_array_element_index|

        temporary_array_of_hashes.push(csv_as_array_of_hashes[csv_array_element_index])

        array_of_modifier_hashes = generate_array_of_modifier_hashes(get_modifiers_as_hash_from(csv_array_element))

        remove_modifiers_from(temporary_array_of_hashes)

        formatted_csv_data[csv_array_element_index] = formatted_csv_row(array_of_modifier_hashes, temporary_array_of_hashes)
    }

    @generated_json = JSON.pretty_generate(formatted_csv_data)
    puts "#{UserMessages::GeneralMessages::JSON_GENERATED} #{@file_name}\n\n#{@generated_json}"
  end

end
