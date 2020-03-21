class ArtworksController < ApplicationController
    def index
        artworks = Artwork.where(artist_id: params[:user_id])

        shared_artworks = User.find_by(id: params[:user_id]).shared_artwork

        render json: artworks + shared_artworks
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        artwork = Artwork.find_by(id: params[:id])

        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            redirect_to "/artworks/#{artwork.id}"
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        # note: we use find_by :id here because we used resources
        artwork = Artwork.find_by(id: params[:id])

        artwork.destroy
        render json: artwork
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
