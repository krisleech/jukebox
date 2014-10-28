require 'support/feature_helper'

feature 'voting for a song' do
  let!(:song) { Song.create(title: 'Feeling Good') }

  scenario 'vote recorded' do
    visit root_url

    within "##{song.title.parameterize}" do
      click_on 'Vote'
    end

    expect(page).to have_content('Successfully voted for Feeling Good')
  end
end
