class ArtworkSharesController < ApplicationController
  def create
    share = ArtworkShare.new(share_params)

    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share = ArtworkShare.find_by(id: params[:id])

    if share
      render json: share
      share.destroy
    else
      render 'Unable to find share', status: :not_found
    end
  end

  private
  def share_params
    params.require(:share).permit(:viewer_id, :artwork_id)
  end
end