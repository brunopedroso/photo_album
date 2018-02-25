require 'rmagick'
include Magick

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

def generate_thumbnail(dir, file)
  original = "#{dir}/#{file}"
  thumb = "#{dir}/thumbs/#{file}"
  if File.exists? "#{dir}/thumbs/#{file}"
    puts "existing #{thumb}"
    return
  end
  puts thumb
  img = ImageList.new original
  thumb = img.resize_to_fit(100)
  thumb.write thumb
end

def generate_thumbnails(dir)
  Dir.mkdir "#{dir}/thumbs" unless Dir.exists? "#{dir}/thumbs"
  list_files(dir).reject{|f| f == 'index.json' ||  f == '.DS_Store'}.each do |filename|
    generate_thumbnail dir, filename
  end
end

# dirs.each do |dir|
#   puts "generating thumbs for #{dir}"
#   generate_thumbnails dir
# end

generate_thumbnails 'Beto_sabado'