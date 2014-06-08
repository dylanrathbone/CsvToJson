module JsonGeneratorHelper

  # We will assume that the csv file when generated
  # will always have a name/price pair for a modifier/s.
  # A modifier can never specify without both.
  def modifiers_as_hash(csv_array_element)
    modifiers_as_hash = {}
    csv_array_element.each_with_index { |(key, value)|
      if (!!(key.to_s =~ /^modifier_(\d{1,4})/)) && ((!value.to_s.eql?("")))
        modifiers_as_hash[key] = value
      end
    }
    return modifiers_as_hash
  end

  # We will assume each generated hash's in this method will
  # comprise of a respective name/price pair for each individual
  # modifier
  def build_array_of_modifier_hashes_from(modifiers_as_hash)
    array_of_modifier_hashes = []
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
    return array_of_modifier_hashes
  end

  def build_formatted_csv_row_from(array_of_modifiers, temporary_hash_array)
    hash = Hash[*temporary_hash_array.flatten]
    hash[:modifiers] = array_of_modifiers
    reset(temporary_hash_array)
    return hash
  end

  def reset(temporary_array)
    temporary_array.delete_at(0)
  end

  def remove_modifiers_from(temporary_array)
    temporary_array[0].delete_if { |key| key.to_s =~ /^modifier_/ }
  end

end