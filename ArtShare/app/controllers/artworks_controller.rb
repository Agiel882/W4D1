class ArtworksController < ApplicationController

  def index
    artworks = Artwork.joins(:shared_viewers).find_by(artist_id: params[:user_id]).find_by()
    render json: artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :not_found
    end
  end

  def update
    artwork = Artwork.update(params[:id], artwork_params)
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :not_found
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])

    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :not_found
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :img_url, :artist_id)
  end
end