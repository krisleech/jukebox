class VotesController < ApplicationController
  def create
    VoteForSong.call(song_id)
    redirect_to root_url, notice: "Successfully voted"
  end

  private

  def song_id
    params[:song_id]
  end
end
