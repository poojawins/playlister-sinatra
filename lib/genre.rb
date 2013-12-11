class Genre
  attr_accessor :name, :songs
  
  def self.find_by_name(name)
    all.detect{|a| a.name == name}
  end

  def self.list
    all.each_with_index do |o, index|
      puts "#{index+1}. #{o.name}"
    end
  end

  def initialize
    self.class.all << self
    @songs = []
  end

  # def self.action(index)
  #   self.all[index-1].list_songs
  # end

  def self.list_songs(index)
    self.all[index -1].list_songs
  end

  def list_songs
    # this should be pulled out of both artist and genre into listable
    self.songs.all.each_with_index do |s, index|
      puts "#{index+1}. #{s.name}"
    end
  end

  def self.reset_genres
    reset_all
  end

  def artists
    songs.collect{|s| s.artist}.uniq
  end

  def self.reset_all
    @all = []
  end

  def count
    self.class.all.size
  end

  def self.count
    @all.size
  end

  def self.all
    @all
  end
  reset_genres

end

# class Genre
	
#   attr_accessor :name, :songs, :artists #, :genre, 
#   GENRES = []
	
#   def initialize(name="N/A") #genre=[], 
# 	 #@genre = genre
#    @songs = []
#    @name = name
#    @artists = []
#    GENRES << self
# 	end

#   def self.reset_genres
#     GENRES.clear
#   end

#   def self.all
#     GENRES
#   end

#   # def self.count
#   #   GENRES.count
#   # end

#   # def artists=(artist)
#   #   @artist = artist
#   #   @artist << self
#   # end

	
# end

