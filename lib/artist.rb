require "pry"

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(name)
    @songs << name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    found = self.all.find { |artist| artist.name == name }
    if found.nil?
      new = Artist.new(name)
      new.save
      new
    end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
