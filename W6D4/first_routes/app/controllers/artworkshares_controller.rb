class ArtworksharesController < ApplicationController 
    def index
        artworkshares = ArtworkShare.all
        render json: artworkshares
    end

    def create
        artworkshares = ArtworkShare.new(artworkshares_params)

        if artworkshares.save
            render json: artworkshares
        else
            render json: artworkshares.errors.full_messages, status: 422
        end
    end

    def show
        artworkshares = ArtworkShare.find_by(id: params[:id])

        render json: artworkshares
    end

    def update
        artworkshares = ArtworkShare.find(params[:id])

        if artworkshares.update(artworkshares_params)
            redirect_to "/artworkshares/#{artworkshares.id}"
        else
            render json: artworkshares.errors.full_messages, status: 422
        end
    end

    def destroy
        # note: we use find_by :id here because we used resources
        artworkshares = ArtworkShare.find_by(id: params[:id])

        artworkshares.destroy
        render json: artworkshares
    end


    private

    def artworkshares_params
        params.require(:artworkshares).permit(:artwork_id, :viewer_id)
    end
end
