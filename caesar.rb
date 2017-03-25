# Caesar cipher, shifts the letters of strings
# Could certainly be redone in a more "functional" way

def convert(letter,cipher)
  letter = letter.ord.to_i
  if letter.between?(65,90)
    if letter + cipher <= 90
      letter += cipher
    else
      letter += (cipher - 26)
    end
  end
  if letter.between?(97,122)
    if letter + cipher <= 122
      letter += cipher
    else
      letter += (cipher - 26)
    end
  end
  letter.chr
end

puts "Enter your string:"
input = gets.chomp

cipher = 0

until cipher.between?(1,25)
  puts "Enter your cipher (from 1 to 25):"
  cipher = gets.chomp.to_i
  if !cipher.between?(1,25)
    puts "Your cipher must be an integer between 1 and 25!"
  end
end

new_string = ""

input.split('').each do |letter|
  new_string << convert(letter,cipher) 
end

puts "Here's your coded string:"

puts new_string