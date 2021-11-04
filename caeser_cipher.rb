def encrypt(string, shift)
  string.chars.map do |char|
    if char.match(/[a-z]/)
      ((char.ord - 97 + shift) % 26 + 97).chr
    elsif char.match(/[A-Z]/)
      ((char.ord - 65 + shift) % 26 + 65).chr
    else
      char
    end
  end.join
end

def decrypt(string, shift)
  encrypt(string, -shift)
end

if __FILE__ == $PROGRAM_NAME
  string = ARGV[0]
  shift = ARGV[1].to_i
  if ARGV.length == 2
    puts encrypt(string, shift)
  elsif ARGV.length == 3
    puts decrypt(string, shift)
  else
    puts "Usage: caeser_cipher.rb <string> <shift>"
  end
end
