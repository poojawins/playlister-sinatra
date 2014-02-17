require 'bundler'
Bundler.require
require './lib/parser.rb'


class Playlister < Sinatra::Application

  my_parser = Parser.new
  my_parser.parse_directory

  get '/' do
    erb :index
  end

  get '/artists' do
    @artists = Artist.list
    erb :artist_output
  end
  
  get '/artists/:artist' do
    @artist = Artist.find_by_name(params[:artist])
    erb :artist_info
  end

  get '/genres' do
    @genres = Genre.list
    erb :genre_output
  end

  get '/genres/:genre' do
    @genre = Genre.find_by_name(params[:genre])
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

  helpers do
    def partial(file_name)
      erb file_name, :layout => false
    end
  end

end

