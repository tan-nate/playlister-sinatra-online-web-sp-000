class SongsController < ApplicationController
  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    binding.pry
    @genres = Genre.all
    binding.pry
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song = Song.create(name: params[:name], genre_ids: params[:genre_ids])
    song.artist = artist
    redirect "songs/#{song.id}"
  end

  get '/songs/:id' do
    @song = Song.find(params:id)
    erb :'/songs/show'
  end
end
