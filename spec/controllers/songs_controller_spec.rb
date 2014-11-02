require 'rails_helper'

describe SongsController do
  describe 'GET index' do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end
  end
end
