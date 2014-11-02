require 'rails_helper'

describe VotesController do
  describe 'POST create' do
    let!(:song) { Song.create(title: 'foo-song') }

    it 'redirects' do
      post :create, song_id: song.id
      expect(response).to be_redirect
    end

    it 'calls service' do
      expect_any_instance_of(VoteForSong).to receive(:call)
      post :create, song_id: song.id
    end
  end

end
