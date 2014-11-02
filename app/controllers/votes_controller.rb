class VotesController < ApplicationController
  def create
    cast_vote = VoteForSong.new(song_id)
    cast_vote.call
    redirect_to root_url, notice: 'Successfully voted for Feeling Good'
  end

  private

  def song_id
    params[:song_id]
  end
end
