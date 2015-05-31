content = File.read("file.txt")
content.scan(/<tr>\s*<td>[0-9]+<\/td>\s*<td><a href="\/wiki\/[^"]+" title="[^"]+">([^<]+)<\/a><\/td>/m).each do |e|
  puts e[0]
end
