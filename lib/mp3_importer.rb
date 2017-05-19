require "pry"

class MP3Importer

  attr_accessor :path, :files, :import

  def initialize(path)
    @path = path
  end

  def files
    arr = Dir["#{path}/**/*.mp3"]
    arr.map {|song| song.slice!(path+"/")}
    arr
  end

  def import
    create = []
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end

  end

end
