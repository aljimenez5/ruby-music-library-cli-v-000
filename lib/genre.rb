class Genre 
  attr_accessor :name, :artist 
  attr_reader :genre
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def artist 
    genre.artist = self
  end
  
  def artists 
    @songs.collect {|song| song.artist}.uniq
  end
  
end