require './utils'
require 'json'

def writeJson(file, dir)
  elements = list_files(dir).map do |filename|
    {
      img: "#{filename}",
      thumb: "thumbs/#{filename}",
    }
  end

  file.write("window.photos = ")
  file.write(elements.to_json)
end

def generate_index_files
  dirs('./albuns').each do |dir|
    File.open("./albuns/#{dir}/index.json", 'w') do |f|
      writeJson f, "albuns/#{dir}"
    end
  end
end

# File.open("out.json", 'w') do |f|
#   writeJson f, 'Beto_sabado'
# end

generate_index_files