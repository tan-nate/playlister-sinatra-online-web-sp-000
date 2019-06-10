class SongsController < ApplicationController
  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist_name])
    song = Song.create(name: params[:name], genre_ids: params[:genre_ids])
    song.artist = artist
    redirect "songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(:slug)
    erb :'/songs/show'
  end
end
