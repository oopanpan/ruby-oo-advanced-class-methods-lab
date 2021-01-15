require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = self.new
    # self.all << song
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    result = @@all.select {|song| song.name ==name}
    result[0]
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(name)
    list = name.split(" - ")
    song = Song.new
    song.artist_name = list[0]
    song.name = list[1].delete_suffix('.mp3')
    song
  end


  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end
  
end