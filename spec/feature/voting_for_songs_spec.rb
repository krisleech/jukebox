require 'support/feature_helper'

feature 'voting for a song' do

  scenario 'vote recorded' do
    visit root_url

    within '#feeling_good' do
      click_on 'Vote'
    end

    expect(response).to have_content('Successfully voted for Feeling Good')
  end

end
