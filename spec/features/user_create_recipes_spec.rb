require 'rails_helper'

feature 'User create recipe' do
  scenario 'successfully' do
    visit new_recipe_path

    fill_in 'Nome', with: 'Lasanha'
    fill_in 'Cozinha', with: 'Italiana'
    fill_in 'Tipo', with: 'Principal'
    fill_in 'Quantidade de pessoas', with: '5'
    fill_in 'Tempo de preparo', with: '120'
    fill_in 'Nível de dificuldade', with: 'Fácil'
    fill_in 'Ingredientes', with: 'Massa, Queijo, Molho'
    fill_in 'Passo a passo', with: 'Monte, Asse'

    click_on 'Cadastrar Receita'

    expect(page).to have_content 'Lasanha'
    expect(page).to have_content 'Italiana'
    expect(page).to have_content 'Principal'
    expect(page).to have_content '5'
    expect(page).to have_content '120'
    expect(page).to have_content 'Fácil'
    expect(page).to have_content 'Massa, Queijo, Molho'
    expect(page).to have_content 'Monte, Asse'
  end

  scenario 'with invalid data' do
    visit new_recipe_path

    fill_in 'Nome', with: ''
    fill_in 'Cozinha', with: ''
    fill_in 'Tipo', with: ''
    fill_in 'Ingredientes', with: ''
    fill_in 'Passo a passo', with: ''

    click_on 'Cadastrar Receita'

    expect(page).to have_content 'Não foi possível cadastrar a receita'
  end
end
