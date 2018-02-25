def dirs(base)
  dirs = Dir.entries(base).select { |entry|
    File.directory? File.join(base, entry) and !(entry =='.' || entry == '..')
  }
end

def list_files(dir)
  dirs = Dir.entries(dir).select { |entry|
    File.file? File.join(dir, entry)
  }.reject { |f|
    [
      'index.json',
      'index.html',
      '.DS_Store',
    ].include?(f)
  }
end