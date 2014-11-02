class VotesController < ApplicationController
  def create
    cast_vote = VoteForSong.new(song_id)
    cast_vote.subscribe(RoutemasterListener.new, prefix: 'on')
    cast_vote.call
    redirect_to root_url, notice: "Successfully voted"
  end

  private

  def song_id
    params[:song_id]
  end
end
