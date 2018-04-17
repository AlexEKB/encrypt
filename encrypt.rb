require 'digest'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Введите слово для шифрования: "
word = STDIN.gets.chomp

encrypt_method = ''

until([1,2].include?(encrypt_method)) do
  puts "Каким способом зашифровать: \n 1.MD5 \n 2.SHA1"
  encrypt_method = STDIN.gets.chomp.to_i
end

puts "Вот, что получилось:"

case encrypt_method
when 1
  puts Digest::MD5.hexdigest(word)
when 2
  puts Digest::SHA1.hexdigest(word)
end
