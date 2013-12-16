require 'bundler'
Bundler.require
require './lib/parser.rb'


class Playlister < Sinatra::Application

  my_parser = Parser.new
  my_parser.parse_directory

  get '/' do
    erb :index
  end

  get '/artist' do
    @artists = Artist.list
    erb :artist_output
  end
  
  get '/artist/:artist' do
    @artist = Artist.find_by_name(params[:artist])
    erb :artist_info
  end

  get '/genre' do
    @genres = Genre.list
    erb :genre_output
  end

  get '/genre/:genre' do
    @genre = genre(params[:genre])
    erb :genre_info
  end

  get '/songs' do
    @songs = Song.list
    erb :song_output
  end

  get '/songs/:song' do
    @song = Song.find_by_name(params[:song])
    erb :song_page
  end

end

