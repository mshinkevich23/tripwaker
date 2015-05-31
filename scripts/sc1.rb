content = File.read("file1.txt")
content.scan(/<tr>\s*<td>\s*<b>\s*<a href="\/wiki\/[^"]+"[^>]+>([^<]+)<\/a><\/b>/m).each do |e|
  puts e[0]
end
