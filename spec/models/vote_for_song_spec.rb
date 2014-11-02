require 'support/activerecord_helper'
require_relative '../../app/models/vote_for_song'
require_relative '../../app/models/song'

describe VoteForSong do
  subject(:service) { VoteForSong.new(song.id) }

  let!(:song) { Song.create(title: 'foobar') }

  describe '#call' do
    it 'increments vote count' do
      expect { subject.call }.to change { song.reload.votes }.by(1)
    end

    it 'publishes an event' do
      listener = double('Listener')
      expect(listener).to receive(:on_vote_cast).with(song.id)
      subject.subscribe(listener, prefix: 'on')
      subject.call
    end

    it 'returns self' do
      expect(subject.call).to eq subject
    end
  end
end
