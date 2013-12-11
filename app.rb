require 'bundler'
Bundler.require
require './lib/parser.rb'


class Playlister < Sinatra::Application

  get '/artist' do
    my_parser = Parser.new
    my_parser.parse_directory
    @artists = Artist.list
    erb :artist_output
  end
  
  get '/artist/:artist' do
    my_parser = Parser.new
    my_parser.parse_directory
    @artist = Artist.find_by_name(params[:artist])
    erb :artist_info
  end

  # get '/genre' do
  #   my_genre = Parser.new
  #   @genres = my_genre.parse_genre
  #   erb :genre_output
  # end

  # get '/song' do
  #   my_song = Parser.new
  #   @songs = my_song.parse_song
  #   erb :song_output
  # end


end



