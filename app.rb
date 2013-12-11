require 'bundler'
Bundler.require
require './lib/parser.rb'


class Playlister < Sinatra::Application

  # before do 
  #   my_parser = Parser.new
  #   my_parser.parse_directory
  # end

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

  get '/genre' do
    genre_parser = Parser.new
    genre_parser.parse_directory
    @genres = Genre.list
    erb :genre_output
  end

  get '/genre/:genre' do
    my_parser = Parser.new
    my_parser.parse_directory
    @genre = Genre.find_by_name(params[:genre])
    erb :genre_info
  end

  get '/song' do
    song_parser = Parser.new
    song_parser.parse_directory
    @songs = Song.list
    erb :song_output
  end

  get '/song/:song' do
    song_parser = Parser.new
    song_parser.parse_directory
    @songs = Song.list(params[:song])
    erb :song_info
  end


end

