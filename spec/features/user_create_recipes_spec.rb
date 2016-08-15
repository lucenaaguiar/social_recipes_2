require 'rails_helper'

feature 'User create recipe' do
  scenario 'successfully' do
    create(:cuisine, name: 'Italiana')
    create(:food_type, name: 'Principal')
    visit new_recipe_path

    fill_in 'Nome', with: 'Lasanha'
    select  'Italiana', from: 'Cozinha'
    select  'Principal', from: 'Tipo'
    fill_in 'Quantidade de pessoas', with: '5'
    fill_in 'Tempo de preparo', with: '120'
    fill_in 'Nível de dificuldade', with: 'Fácil'
    fill_in 'Ingredientes', with: 'Massa, Queijo, Molho'
    fill_in 'Passo a passo', with: 'Monte, Asse'
    attach_file('Foto', "#{Rails.root}/spec/fixtures/lasanha.png")

    click_on 'Cadastrar Receita'

    expect(page).to have_content 'Lasanha'
    expect(page).to have_content 'Italiana'
    expect(page).to have_content 'Principal'
    expect(page).to have_content '5'
    expect(page).to have_content '120'
    expect(page).to have_content 'Fácil'
    expect(page).to have_content 'Massa, Queijo, Molho'
    expect(page).to have_content 'Monte, Asse'
    expect(page).to have_xpath("//img[contains(@src,'lasanha.png')]")
  end

  scenario 'with invalid data' do
    visit new_recipe_path

    fill_in 'Nome', with: ''
    select  '', from: 'Cozinha'
    select  '', from: 'Tipo'
    fill_in 'Ingredientes', with: ''
    fill_in 'Passo a passo', with: ''

    click_on 'Cadastrar Receita'

    expect(page).to have_content 'Não foi possível cadastrar a receita'
  end
end
