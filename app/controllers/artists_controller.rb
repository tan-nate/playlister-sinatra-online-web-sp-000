class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.all.find_by_slug(params[:slug])
    @songs = Song.all
    @genres = Genre.all
    erb :'artists/show'
  end
end
