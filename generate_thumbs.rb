require './utils'
require 'rmagick'
include Magick

def generate_thumbnail(dir, file)
  original = "#{dir}/#{file}"
  thumb_name = "#{dir}/thumbs/#{file}"
  if File.exists? thumb_name
    puts "existing #{thumb_name}"
    return
  end
  puts thumb_name
  img = ImageList.new original
  thumb = img.resize_to_fit(200)
  thumb.write thumb_name
  thumb.destroy!
  img.destroy!
end

def generate_thumbnails(dir)
  Dir.mkdir "#{dir}/thumbs" unless Dir.exists? "#{dir}/thumbs"
  list_files(dir).each do |filename|
    generate_thumbnail dir, filename
  end
end

dirs('albuns').each do |d|
  dir = "albuns/#{d}"
  puts "generating thumbs for #{dir}"
  generate_thumbnails dir
end

# generate_thumbnails 'albuns/Beto_sabado'