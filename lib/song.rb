class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    @@all << self.new
    @@all.last
end


  def save
    self.class.all << self
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    @@all.last
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
end

  def self.find_or_create_by_name(song_name)
    @@all.find do |song|
     song.name == song_name
        song.name
    end
    self.create_by_name(song_name)
  end

def self.alphabetical
  @@all.sort_by{|song| song.name}
end

def self.new_from_filename(file_name)
      artist_name = file_name.split(' - ')[0]
      song_name = file_name.split(' - ')[1].chomp('.mp3')
     song = self.new_by_name(song_name)
     song.artist_name = artist_name
     song
end

def self.create_from_filename(file_name)
     song = self.new_from_filename(file_name)
     @@all << song
     song
  end
def self.destroy_all
  @@all.clear 
end

end
