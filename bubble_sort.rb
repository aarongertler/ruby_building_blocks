$checks = 0

def bubble_sort_v1 array
  if array.length == 0
    return []
  end
  swaps = 0
  (array.length - 1).times do |n|
    $checks += 1
    if array[n] > array[n+1]
      array[n],array[n+1] = array[n+1],array[n]
      swaps += 1
    end
  end
  return array if swaps == 0
  bubble_sort_v1(array[0...-1]) << array[-1] # The last item in the array will never be swapped in successive passes -- the highest number always ends up here
  # bubble_sort_v1(array)
end




def bubble_sort_v2(array)
  while true # Lets us loop over and over again through the same array
    swaps = 0
    array.each_index do |ind|
      $checks += 1
      if (ind < array.length - 1) && (array[ind] > array[ind + 1])
        array[ind], array[ind + 1] = array[ind + 1], array[ind]
        swaps += 1
      end
    end
    break if swaps == 0
  end
  array
end

# V2 compared to V1: Works better with pre-sorted strings (won't keep recurring if things sort out quickly), but loses time
# by continuing to check the "set" numbers of the array after they've been correctly swapped into place
# V1 will always make (1+2+3...+ array.length - 1) checks
# V2 checks vary, can be a lot higher or a lot lower
# Never mind -> added the swap-check to V1, which minimizes the number of checks we actually make
# Though the extra complication of V1 might very well still render it slower

# puts bubble_sort_v1([4,3,78,2,0,2,4,5,12,37,9,68,3]).to_s # 72 checks
# puts bubble_sort_v1([1,2,4,3,5,6,7,9,8,1,0,13,11,12]).to_s # 88 checks
# puts bubble_sort_v2([4,3,78,2,0,2,4,5,12,37,9,68,3]).to_s # 117 checks
# puts bubble_sort_v2([1,2,4,3,5,6,7,9,8,10,13,11,12]).to_s # 26 checks
puts "Checks made: #{$checks}"

# The below gives us the flexibility to sort by any criteria we want

def bubble_sort_by(arr, &block) # We could make this recursive a la V1 (above), but it's getting late
  if !block_given?
    puts "Please include a block!"
  end
  while true
    swaps = 0
    arr.each_index do |i|
      if i < arr.length - 1 # We haven't yet reached the end of the array
        if block.call(arr[i],arr[i+1]) > 0
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
          swaps += 1
        end
      end
    end
    break if swaps == 0
  end
  puts arr
end
      # No need to yield, we can just call the block

bubble_sort_by(["hi","hello","hey","heck","herder"]) do |left,right|
  left.length - right.length
end