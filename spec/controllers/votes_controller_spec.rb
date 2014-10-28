require 'rails_helper'

describe VotesController do
  describe 'POST create' do
    let!(:song) { Song.create(title: 'foo-song') }

    it 'redirects' do
      post :create, song_id: song.id
      expect(response).to be_redirect
    end

    it 'increments votes' do
      expect do
        post :create, song_id: song.id
      end.to change { song.reload.votes }.by(1)
    end
  end

end
