require_relative './artist.rb'
require_relative './song.rb'
require_relative './genre.rb'

class Parser
  
  # def initialize(user_search)
  # end


def parse_directory
  songs = Dir.entries('data').delete_if{|str| str[0] == "."}
  songs.each do |filename|
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1].split("[")[0].strip
    genre_name = filename.split(" - ")[1].split(/\[|\]/)[1]

    artist = Artist.find_by_name(artist_name) || Artist.new.tap{|a| a.name = artist_name}

    song = Song.new
    song.name = song_name

    genre = Genre.find_by_name(genre_name) || Genre.new.tap{|g| g.name = genre_name}

    song.genre = genre
    artist.add_song(song)
  end
end

  # def parse_artist
  #   files = Dir.entries('data').select { |f| !File.directory? f }
  #   catalog = []
  #   artist = /((.*) (?=\-))/
  #   files.each do |item|
  #     song_array = []
  #     a = item.match(artist).to_s.strip
  #     song_array << a
  #     catalog << song_array
  #   end
  #   catalog
  # end

  # def parse_song
  #   song = /(?<=\-\s).*(?=\s\[)/
  #   catalog = []
  #   files.each do |item|
  #     song_array = []
  #     s = item.match(song).to_s
  #     song_array << s
  #     catalog << song_array
  #   end
  #   catalog
  # end

  # def parse_genre
  #   genre = /(?<=\[).*(?=\])/
  #   catalog = []
  #   files.each do |item|
  #     song_array = []
  #     g = item.match(genre).to_s
  #     song_array << g
  #     catalog << song_array
  #   end
  #   catalog
  # end

  #  files = Dir.entries('data').select { |f| !File.directory? f}
end

