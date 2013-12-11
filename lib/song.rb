class Song
  attr_accessor :artist, :genre, :name

  def self.list
    all.each_with_index do |o, index|
      puts "#{index+1}. #{o.name}"
    end
  end

  def initialize
    self.class.all << self
  end

  def self.action(index)
    self.all[index-1].play
  end

  def self.play(index)
    all[index - 1].play
  end

  def play
    puts "playing #{self.title}, enjoy!"
  end

  def title
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
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

  reset_all

end

# class Song
  
#   attr_accessor :songs, :name #, :artist
#   #attr_reader :genre

# 	def initialize(songs=[], genre=[])
#     @songs = songs
#     @genre = genre
#     @name = name
#     #@artist = artist
# 	end

#   def genre
#     @genre
#   end

#   def genre=(genre2)
#     @genre = genre2
#     @genre.songs << self
#     @genre
#   end

#   # def artist=(artist2)
#   #   @artist = artist2
#   #   @artist.songs << self
#   #   @artist
#   # end

# end

