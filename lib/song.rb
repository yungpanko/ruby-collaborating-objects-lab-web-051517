require "pry"

class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    split = filename.split(" - ")
    split_artist = split[0]
    split_song_title = split[1]
    song = Song.new(split_song_title)
    song.artist = Artist.find_or_create_by_name(split_artist)
    unless song.artist.nil?
      song.artist.songs << split_song_title
    end
    song
  end




end
