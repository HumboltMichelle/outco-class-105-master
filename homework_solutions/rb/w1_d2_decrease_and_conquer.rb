# Homework - Decrease and Conquer

# Number of Ones: Given a sorted bit array (values of either 0 or 1),
# ... determine the number of 1's in the array.

# Parameters
# Input: arr (ints)
# Output: int

# Constraints
# Time: O(logN)
# Space: O(1)

# Examples:
# [0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1] --> 8
# [0, 0, 0] --> 0
# [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1] --> 7
# [1, 1, 1] --> 3

def number_of_ones(arr)
  start = 0
  last = arr.length
  while start < last
    midpoint = start + (last - start)/2
    if arr[midpoint] == 0
      start = midpoint + 1
    else
      last = midpoint
    end
  end
  return arr.length - start
end


# Closest value: Given a sorted array of integers, and a target value,
# ... find the number in the array that is closest to the target.

# Parameters
# Input: arr (ints)
# Input: target (int)
# Output: int

# Constraints
# If there are two numbers tied for the closest value, return the lowest value.
# Time: O(logN)
# Space: O(1)

# [1, 2, 3, 5, 5, 7, 9, 10, 11], 6 --> 5
# [1, 2, 3], 8 --> 3
# [-2, -1, 0], -5 --> -2


def closest_value(arr, target)
  # set closest to be infinity.
  closest = 1.0/0
  value = nil
  start = 0
  last = arr.length - 1
  while start <= last
    midpoint = start + (last - start)/2
    difference = (target - arr[midpoint]).abs
    if difference < closest
      closest = difference
      value = arr[midpoint]
    elsif difference == closest and arr[midpoint] < value
      value = arr[midpoint]
    end
    if arr[midpoint] < target
      start = midpoint + 1
    else
      last = midpoint - 1
    end
  end
  return value
end

# Square Root: Given an positive integer, find the square root.

# Parameters
# Input: value (int)
# Output: float

# Constraints
# Do not use a native built in method.
# Ensure the result is accurate to 6 decimal places (0.000001)
# Time: O(logN)
# Space: O(1)

# Examples:
# 4 --> 2.0
# 98 --> 9.899495
# 14856 --> 121.885192

def square_root(n)
  if n == 1 or n == 0
    return n
  end
  low = 0
  high = n
  result = nil
  while low <= high
    mid = ((low + high)/2)
    sq = mid * mid
    if sq == n
      return mid
    elsif sq < n
      low = mid + 0.0000001
      result = mid
    else
      high = mid - 0.0000001
    end
  end
  return result.round(6)
end


# Greater Values: Given an sorted array of integers,
# ... and a target value return the number of values greater the target.

# Parameters
# Input: arr (ints)
# Input: target {Integer} Output: {Integer}

# Constraints
# Time: O(logN)
# Space: O(1)

# Examples:
# [1, 2, 3, 5, 5, 7, 9, 10, 11], 5 --> 4
# [1, 2, 3], 4 --> 0
# [1, 10, 22, 59, 67, 72, 100], 13 --> 5


def greater_values(arr, target)
  start = 0
  last = arr.length
  while start < last
    midpoint = start + (last - start)/2
    if arr[midpoint] <= target
      start = midpoint + 1
    else
      last = midpoint
    end
  end
  arr.length - start
end

# Rotated Sorted Array [Extra Credit]

# Given a array that is sorted and rotated, find out if a target value exists in the array.

# Parameters
# Input: arr (ints)
# Output: boolean

# Constraints
# Time: O(logN)
# Space: O(1)

# Examples:
# [35, 46, 79, 102, 1, 14, 29, 31], 46 --> True
# [35, 46, 79, 102, 1, 14, 29, 31], 47 --> False
# [35, 46, 79, 102, 1, 14, 29, 31], 47 --> false
# [7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 9 --> true

def rotated_array_search(nums, target)
  start = 0
  last = nums.length - 1
  while (start < last and nums[start] > nums[last])
    mid = (start + last) / 2
    if nums[start] < nums[mid]
      start = mid
    else
      last = mid
    end
  end
  if target >= nums[0]
    return binary_search(nums, 0, last, target)
  else
    return binary_search(nums, last + 1, nums.length - 1, target)
  end
end

def binary_search(nums, start, last, target)
  while (start <= last)
    mid = (start + last) / 2
    if nums[mid] == target
      return true
    elsif nums[mid] < target
      start = mid + 1
    else
      last = mid - 1
    end
  end
  false
end



# Multiplication Russian Peasant [Extra Credit]

# Multiplication given two positive integers, return its product using Russian Peasant method of multiplication

# Parameters
# Input: a (int)
# Input: b (int)
# Output: int

# Constraints
# Assume a <= b, and the value of a is N.
# Time: O(logN)
# Space: O(1)

# 487, 734 --> 357458
# 846, 908--> 768168

def multiplication_russian_peasant(a, b)
  final_sum = 0
  while b >= 1
    if b % 2 != 0
      final_sum += a
    end
    if b == 1
      break
    end
    a *= 2
    b /= 2
  end
  final_sum
end


#############################################
########  DO NOT TOUCH TEST BELOW!!!  #######
#############################################


# custom expect function to handle tests
# List count : keeps track out how many tests pass and how many total
#   in the form of a two item array i.e., [0, 0]
# String name : describes the test
# Function test : performs a set of operations and returns a boolean
#   indicating if test passed

def expect(count, name, test)
  count[1] = count[1] + 1

  result = 'false'
  err_msg = nil
  begin
    if test
      result = ' true'
      count[0] = count[0] + 1
    end
  rescue NameError => e
    MyModule::Logger.error("Error loading the deployer #{class_name}. This deployer it's not installed!")
  rescue StandardError => err
    err_msg = err.message
  end
  puts'  ' + (count[1]).to_s + ')   ' + result + ' : ' + name
  if err_msg != nil
    puts'       ' + err_msg + '\n'
  end
end


# code for checking if lists are equal
def arrays_equal(arr1, arr2)
  if arr1.length != arr2.length
    return false
  end
  for i in 0..arr1.length-1
    if arr1[i] != arr2[i]
      return false
    end
  end
  true
end


puts "\nNumber of Ones"
test_count = [0, 0]

def test()
  example = number_of_ones([0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1])
  return example != nil && example == 8
rescue StandardError => err
  puts err.message
end
expect(test_count, "should return correct number of ones for array with zeroes and ones", test)

def test()
  example = number_of_ones([0, 0, 0])
  return example != nil && example == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return correct number of ones for array with all zeroes', test)

def test()
  example = number_of_ones([1, 1, 1])
  return example != nil && example == 3
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return correct number of ones for array with all ones', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

puts "\nClosest Value"
test_count = [0, 0]

def test()
  example = closest_value([1, 2, 3, 5, 5, 7, 9, 10, 11], 6)
  return example != nil && example == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return correct closest value for number in the middle range', test)

def test()
  example = closest_value([1, 2, 3], 8)
  return example != nil && example == 3
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return closest value for highest number', test)

def test()
  example = closest_value([-2, -1, 0], -5)
  return example != nil && example == -2
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return closest value in array with negative numbers for highest number', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

print("\nSquare Root\n")
test_count = [0, 0]

def test()
  example = square_root(4)
  return example != nil && example == 2.0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return correct square root for number < 10', test)

def test()
  example = square_root(98)
  return example != nil && example == 9.899495
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return correct square root for number between 10 and 100', test)

def test()
  example = square_root(14856)
  return example != nil && example == 121.885192
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return correct square root for number over 10,000', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

puts "\nGreater Values"
test_count = [0, 0]

def test()
  example = greater_values([1, 2, 3, 5, 5, 7, 9, 10, 11], 5)
  return example != nil && example == 4
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return greater values for number in the middle of the array', test)

def test()
  example = greater_values([1, 2, 3], 4)
  return example != nil && example == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return 0 for number greater than largest in the array', test)

def test()
  example = greater_values([1, 10, 22, 59, 67, 72, 100], -2)
  return example != nil && example == 7
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should return greater values for number less than least in the array', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"

puts "\nRotated Sorted Array"
test_count = [0, 0]

def test()
  example = rotated_array_search([35, 46, 79, 102, 1, 14, 29, 31], 46)
  return example != nil && example == true
rescue StandardError => err
  puts err.message
end
expect(test_count, "returns true when target is in the array", test)

def test()
    example = rotated_array_search([35, 46, 79, 102, 1, 14, 29, 31], 47)
    return example != nil && example == false
rescue StandardError => err
  puts err.message
end

expect(test_count, "returns false when target is not in the array", test)

def test()
  example = rotated_array_search([7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 7)
  return example != nil && example == true
rescue StandardError => err
  puts err.message
end

expect(test_count, "returns true when target is the first number in the array", test)

def test()
  example = rotated_array_search([7, 8, 9, 10, 1, 2, 3, 4, 5, 6], 6)
  return example != nil && example == true
rescue StandardError => err
  puts err.message
end

expect(test_count, "returns true when target is the last number in the array", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"



puts ("\nMultuplication Russian Peasant")
test_count = [0, 0]

def test()
  example = multiplication_russian_peasant(487,734)
  return example != nil && example == 357458
rescue StandardError => err
  puts err.message
end

expect(test_count, "returns correct value for two integers", test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
