require 'rails_helper'

feature 'Admin create cuisines' do
  scenario 'successfully' do
    visit new_cuisine_path

    fill_in 'Nome', with: 'Italiana'

    click_on 'Cadastrar Cozinha'

    expect(page).to have_content 'Italiana'
  end

  scenario 'without name' do
    visit new_cuisine_path

    fill_in 'Nome', with: ''

    click_on 'Cadastrar Cozinha'

    expect(page).to have_content 'Não foi possível cadastrar cozinha'
  end
end
