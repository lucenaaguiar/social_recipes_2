require 'rails_helper'

feature 'User view recipes' do
  scenario 'successfully' do
    recipe1 = create(:recipe)
    recipe2 = create(:recipe, name: 'Lasanha')
    recipe3 = create(:recipe, name: 'Bolo de Cenoura')

    visit root_path

    expect(page).to have_content recipe1.name
    expect(page).to have_content recipe2.name
    expect(page).to have_content recipe3.name
  end
end
