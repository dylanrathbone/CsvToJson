#!/usr/bin/ruby

require 'FileTransformer'
require 'ApplicationHelper'
require 'csv'
require 'json'

loaded_file = File.read('stock_data.csv')


csv = CSV.new(loaded_file, :headers => true, :header_converters => :symbol, :converters => :all)
csv_as_array_of_hashes = csv.to_a.map { |row|row.to_hash}
super_array = Array.new
new_csv_as_array_of_hashes = Array.new

csv_as_array_of_hashes.each_with_index { |first_hash_from_array, csv_array_element_index|

    new_csv_as_array_of_hashes.push(csv_as_array_of_hashes[csv_array_element_index])


    modifiers_as_hash = Hash.new
    array_of_modifier_hashes = Array.new

    #Assumption 1: We will assume that the csv when generated will always have a modifier name/price pair. You can never
    #specify a modifier without having both
    def generate_modifier_hash(first_hash_from_array, modifiers_as_hash)
      first_hash_from_array.each_with_index { |(key, value), index|
        if (!!(key.to_s =~ /^modifier_(\d{1,4})/)) && ((!value.to_s.eql?("")))
          modifiers_as_hash[key] = value
        end
      }
    end

    generate_modifier_hash(first_hash_from_array, modifiers_as_hash)


    #Lets generate an array of hashes each hash will contain a respective name/price pair
    #for an individual modifier
    def generate_array_of_modifier_hashes(array_of_modifier_hashes, modifiers_as_hash)
      modifiers_as_hash.each { |key, value|
        modifier_id = key.to_s.split(/_/)[1]
        if key.to_s =~ /^modifier_(\d{1,4})_name/
          hash = Hash.new
          hash[:name] = value
          price_key = "modifier_#{modifier_id}_price".downcase.gsub(/\s+/, "_").to_sym
          hash[:price] = modifiers_as_hash[price_key]
          array_of_modifier_hashes.push(hash)
        end
      }
    end

    generate_array_of_modifier_hashes(array_of_modifier_hashes, modifiers_as_hash)


    #delete modifier_elements from original array
    #csv_as_array_of_hashes[csv_array_element_index].delete_if{|key| key.to_s =~ /^modifier_/}
    new_csv_as_array_of_hashes[0].delete_if{|key| key.to_s =~ /^modifier_/}


    #Convert to hash
    hash = Hash[*new_csv_as_array_of_hashes.flatten]

    #Then add the modifiers hash to it
    hash[:modifiers] = array_of_modifier_hashes

    super_array[csv_array_element_index] = hash

    new_csv_as_array_of_hashes.delete_at(0)


}

generated_json = JSON.pretty_generate(super_array)
puts "#{generated_json}"


