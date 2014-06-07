module JsonGeneratorHelper

  #Assumption 1:
  # We will assume that the csv when generated will
  # always have a modifier name/price pair.
  # You can never specify a modifier without
  # having both
  def generate_modifier_hash(first_hash_from_array, modifiers_as_hash)
    first_hash_from_array.each_with_index { |(key, value), index|
      if (!!(key.to_s =~ /^modifier_(\d{1,4})/)) && ((!value.to_s.eql?("")))
        modifiers_as_hash[key] = value
      end
    }
  end

  #Assumption 2:
  # Lets generate an array of hashes each
  # hash will contain a respective name/price pair for an individual modifier
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

end