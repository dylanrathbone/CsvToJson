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

    reformatted_csv_data = Array.new
    temporary_hash_array = Array.new
    csv_as_array_of_hashes = load_file.to_a.map { |row| row.to_hash}

    csv_as_array_of_hashes.each_with_index {
        |current_csv_array_element, current_index|

        temporary_hash_array.push(csv_as_array_of_hashes[current_index])

        array_of_modifiers = build_array_of_modifier_hashes_from(modifiers_as_hash_from(current_csv_array_element))

        remove_modifiers_from(temporary_hash_array)

        reformatted_csv_data[current_index] = build_formatted_csv_row_from(array_of_modifiers, temporary_hash_array)
    }

    @generated_json = JSON.pretty_generate(reformatted_csv_data)

    puts "#{UserMessages::GeneralMessages::JSON_GENERATED} #{@file_name}\n\n#{@generated_json}"
  end

end
