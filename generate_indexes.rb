require 'json'

def dirs(base)
  dirs = Dir.entries(base).select { |entry|
    File.directory? File.join(base, entry) and !(entry =='.' || entry == '..')
  }
end

def list_files(dir)
  dirs = Dir.entries(dir).select { |entry|
    File.file? File.join(dir, entry)
  }
end

def writeJson(file, dir)
  files = list_files(dir)
  elements = files.reject{|f| f == 'index.json' ||  f == '.DS_Store'}.map do |filename|
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