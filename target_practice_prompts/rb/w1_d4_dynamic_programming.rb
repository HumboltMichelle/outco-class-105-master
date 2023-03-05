#  Target Practice - Dynamic Programming
#
#
#  Instructions: Dynammic programming takes a lot of practice to recognize as
#                well as develop algorithms. Thus we will be working on a few
#                different problems using dynammic programming.
#


#    1. Coin Sum
#
#            Given an array of coins and a target total, return how many
#            unique ways there are to use the coins to make up that total.
#
#    Input:  coins {Integer Array}, total {Integer}
#    Output: {Integer}
#
#
#   Example:
#    Input:  [1,2,3], 4
#    Output: 4
#
#            1+1+1+1
#            1+3
#            1+1+2
#            2+2
#
#
#    Input:  [2,5,3,6], 10
#    Output: 5
#
#            2+3+5
#            5+5
#            2+3+2+3
#            2+2+6
#            2+2+2+2+2
#
#      Note: You have an unlimited number of each coin type. All coins in the
#            coin array will be unique
#            Order does not matter. Ex: One penny and one nickel to create six
#            cents is equivalent to one nickel and one penny
#
#
# Time Complexity:
# Auxiliary Space Complexity:

def coin_sum(coins, total)
  #YOUR WORK HERE
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


puts "\nCoin Sum Tests"
test_count = [0, 0]

def test()
  example = coin_sum([1, 2, 3], 4)
  return example == 4
rescue StandardError => err
  puts err.message
end
expect(test_count, "should work for first example case", test)

def test()
  example = coin_sum([2, 5, 3, 6], 10)
  return example == 5
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work for second example case', test)

def test()
  example = coin_sum([2], 10)
  return example == 1
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work for a single coin', test)

def test()
  example = coin_sum([7, 15], 20)
  return example == 0
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work when there is no solution', test)

def test()
  example = coin_sum([78, 10, 4, 22, 44, 31, 60, 62, 95, 37, 28, 11, 17, 67, 33, 3, 65, 9, 26, 52, 25, 69, 41, 57, 93, 70, 96, 5, 97, 48, 50, 27, 6, 77, 1, 55, 45, 14, 72, 87, 8, 71, 15, 59], 100)
  return example == 3850949
rescue StandardError => err
  puts err.message
end
expect(test_count, 'should work for variety of coins and large total', test)

puts 'PASSED: ' + (test_count[0]).to_s + ' / ' + (test_count[1]).to_s
