#  Target Practice - Heapsort
#
#  Problem: Heapsort In-Place.
#
#  NOTE: In-place means to manipulate the input list rather than create a
#        new list.
#
#  Input: {List}
#  Output: {List}
#
#  Example: heapsort([4,15,16,50,8,23,42,108])
#           // [4,8,15,16,23,42,50,108]
#

# Worse Time Complexity:
# Worse Auxiliary Space Complexity:
# Average Time Complexity:
# Average Auxiliary Space Complexity:
def heapsort(arr)
  # YOUR WORK HERE
end



############################################################
###############  DO NOT TOUCH TEST BELOW!!!  ###############
############################################################

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
    if test()
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

# code for capturing puts output
require 'stringio'
require 'ostruct'

class Capture

  def self.capture &block

    # redirect output to StringIO objects
    stdout = StringIO.new
    $stdout = stdout

    result = block.call

    # restore normal output
    $stdout = STDOUT

    OpenStruct.new result: result, stdout: stdout.string
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
  return true
end

# code for checking if array is sorted (linear runtime)
def is_sorted(input)
  if (input.length < 2)
    return true
  end
  for i in 1..input.length - 1
    if (input[i-1] > input[i])
      return false
    end
  end
  return true
end


puts 'heapsort tests'
test_count = [0, 0]

def test()
  results = heapsort([5])
  return is_sorted(results)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to sort a single-element array', test)

def test()
  results = heapsort([4,15,16,50,8,23,42,108])
  return arrays_equal(results, [4,8,15,16,23,42,50,108])
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to sort a medium-sized unsorted list', test)

def test()
  results = []
  for i in 0..10000
    results.push(rand(1000000))
  end
  example = heapsort(results)
  return arrays_equal(example, results.sort)
rescue StandardError => err
  puts err.message
end
expect(test_count, 'able to sort a large unsorted array', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s + "\n\n"
