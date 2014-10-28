class VotesController < ApplicationController
  def create
    song = Song.find(song_id)
    song.increment!(:votes)
    song.save
    redirect_to root_url, notice: 'Successfully voted for Feeling Good'
  end

  private

  def song_id
    params[:song_id]
  end
end
