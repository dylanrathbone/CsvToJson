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
    super_array = Array.new
    new_csv_as_array_of_hashes = Array.new

    csv_as_array_of_hashes.each_with_index {
        |first_hash_from_array, csv_array_element_index|
        new_csv_as_array_of_hashes.push(csv_as_array_of_hashes[csv_array_element_index])
        modifiers_as_hash = Hash.new
        array_of_modifier_hashes = Array.new
        generate_modifier_hash(first_hash_from_array, modifiers_as_hash)
        generate_array_of_modifier_hashes(array_of_modifier_hashes, modifiers_as_hash)
        new_csv_as_array_of_hashes[0].delete_if{|key| key.to_s =~ /^modifier_/}
        hash = Hash[*new_csv_as_array_of_hashes.flatten]
        hash[:modifiers] = array_of_modifier_hashes
        super_array[csv_array_element_index] = hash
        new_csv_as_array_of_hashes.delete_at(0)
    }

    @generated_json = JSON.pretty_generate(super_array)
    puts "#{UserMessages::GeneralMessages::JSON_GENERATED} #{@file_name}\n\n#{@generated_json}"
  end

end
