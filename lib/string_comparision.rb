module StringComparision
  def self.quality_test(expected_hash, obtained_hash)
    qarray = []
    expected_hash.each do |ekey, evalue|
      obtained_hash.each do |okey, ovalue|
        if ekey == okey
          if evalue.is_a?(Fixnum) && ovalue.is_a?(Fixnum)
            qarray << calc_distance_for_number(evalue, ovalue)
          else
            qarray << calc_distance(evalue, ovalue)
          end
        end
      end
    end
    final_percentage = qarray.inject{ |sum, el| sum + el }.to_f / qarray.size #return average percentage after calculating diatance of each output result of an unit
    return final_percentage  > 0 ? final_percentage.round(2):0
  end

  # check distance between strings ie expected_string and obtained_string
  def self.calc_distance(expected,other, ins=3, del=3, sub=2)
    # ins, del, sub are weighted costs
    return nil if expected.nil?
    return nil if other.nil?
    dm = []        # distance matrix

    # Initialize first row values
    dm[0] = (0..expected.length).collect { |i| i * ins }
    fill = [0] * (expected.length - 1)

    # Initialize first column values
    for i in 1..other.length
      dm[i] = [i * del, fill.flatten]
    end

    # populate matrix
    for i in 1..other.length
      for j in 1..expected.length
        # critical comparison
        dm[i][j] = [
          dm[i-1][j-1] +
          (expected[j-1] == other[i-1] ? 0 : sub),
          dm[i][j-1] + ins,
          dm[i-1][j] + del
          ].min
        end
      end
      # The last value in matrix is the
      # Levenshtein distance between the strings
      distance = dm[other.length][expected.length]
      expected_length = (expected.length + 2).to_f
      ((1- distance/expected_length)*100) > 0 ? ((1- distance/expected_length)*100) :0
    end

    # check distance between numbers

    def self.calc_distance_for_number(expected, other)
      expected_number = expected.to_s.chars.to_a
      other_number = other.to_s.chars.to_a
      distance = expected_number.zip(other_number).reject{|x| x[0] != x[1]}.flatten.uniq
      return((distance.length/expected_number.length.to_f)*100) > 0 ? ((distance.length/expected_number.length.to_f)*100) : 0
    end
end
