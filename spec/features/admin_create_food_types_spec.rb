require 'rails_helper'

feature 'Admin create food_type' do
  scenario 'successfully' do
    visit new_food_type_path

    fill_in 'Nome', with: 'Principal'

    click_on 'Cadastrar Tipo'

    expect(page).to have_content 'Principal'
  end

  scenario 'without name' do
    visit new_food_type_path

    fill_in 'Nome', with: ''

    click_on 'Cadastrar Tipo'

    expect(page).to have_content 'Não foi possível cadastrar tipo'
  end
end
