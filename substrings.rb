# Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. 
# It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

#     > dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#     => ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#     > substrings("below", dictionary)
#     => {"below"=>1, "low"=>1}

def substrings(sentence,dictionary)
  result = Hash.new
  dictionary.each do |word|
    count = sentence.scan(/#{word}/i).length
    if count > 0
      result[word] = count
    end
  end
  result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)