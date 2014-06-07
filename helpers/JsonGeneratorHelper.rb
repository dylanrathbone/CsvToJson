module JsonGeneratorHelper

  #Assumption 1:
  # We will assume that the csv when generated will
  # always have a modifier name/price pair.
  # You can never specify a modifier without
  # having both
  def get_modifiers_as_hash_from(csv_array_element)
    modifiers_as_hash = Hash.new
    csv_array_element.each_with_index { |(key, value)|
      if (!!(key.to_s =~ /^modifier_(\d{1,4})/)) && ((!value.to_s.eql?("")))
        modifiers_as_hash[key] = value
      end
    }
    return modifiers_as_hash
  end

  #Assumption 2:
  # Lets generate an array of hashes each
  # hash will contain a respective name/price pair for an individual modifier
  def generate_array_of_modifier_hashes(modifiers_as_hash)
    array_of_modifier_hashes = Array.new
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

  def formatted_csv_row(array_of_modifier_hashes, temporary_array_of_hashes)
    hash = Hash[*temporary_array_of_hashes.flatten]
    hash[:modifiers] = array_of_modifier_hashes
    reset(temporary_array_of_hashes)
    return hash
  end

  def reset(temporary_array_of_hashes)
    temporary_array_of_hashes.delete_at(0)
  end

  def remove_modifiers_from(temporary_array_of_hashes)
    temporary_array_of_hashes[0].delete_if { |key| key.to_s =~ /^modifier_/ }
  end

end