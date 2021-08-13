class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    split_name = filename.split(/(\s-\s|.mp3)/)
    new_song = Song.new_by_name(split_name[2])
    new_song.artist_name = split_name[0]
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end
end
