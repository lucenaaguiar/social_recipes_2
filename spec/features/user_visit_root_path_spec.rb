require 'rails_helper'

feature 'user visit root path' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'SocialRecipes')
  end
end
