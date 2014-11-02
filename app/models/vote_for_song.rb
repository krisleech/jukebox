require 'wisper'

class VoteForSong
  include Wisper.publisher

  def initialize(song_id)
    @song_id = song_id
  end

  def call
    song.increment!(:votes)
    song.save!
    broadcast(:vote_cast, song.id)
    self
  end

  def self.call(song_id)
    new(song_id).call
  end

  private

  def song
    @song ||= Song.find(@song_id)
  end
end
