def my_uniq(array)
  unique = []
  array.each do |ele|
    unique << ele unless unique.include?(ele)
  end
  unique
end

def two_sum(array)
  summed = []
  for i in 0...array.length - 1
    for j in i + 1...array.length
      summed << [i, j] if (array[i] + array[j]).zero?
    end
  end
  summed
end

def my_transpose(matrix)
  converted_arr = Array.new(matrix.length) { [] }
  matrix.each_with_index do |row, idx|
    row.each { |n| converted_arr[idx] << n }
  end
  converted_arr
end


def stock_picker(values)
  highest_value = [0, 0, 0]
  for i in 0...values.length - 1
    for j in i + 1...values.length
      difference = values[j] - values[i]
      if difference > highest_value[2]
        highest_value = [i, j, difference]
      end
    end
  end
  highest_value == [0, 0, 0] ? [] : highest_value[0..1]
end
