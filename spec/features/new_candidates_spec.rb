require 'rails_helper'

RSpec.feature "NewCandidates", type: :feature do
  
  context 'Candidate fill the form' do
    scenario 'with valid informations' do
      visit root_path
      
      fill_in 'Nome', with: 'Candidato'
      fill_in 'E-mail', with: 'candidato@candidato.com.br'

      select 1, from: 'HTML'
      select 1, from: 'CSS'
      select 1, from: 'Javascript'
      select 1, from: 'Python'
      select 1, from: 'Django'
      select 1, from: 'iOS'
      select 1, from: 'Android'

      click_button 'Enviar'

      expect(page).to have_content 'obrigado por participar'
      expect(page).to have_link 'Nova candidatura'
    end

    scenario 'with invalid informations' do
      visit root_path
      click_button 'Enviar'
      expect(page).to have_content 'Por favor, preencha corretamente o formulário'
    end
  end

  scenario 'back to index for new candidature' do
    candidate = create :candidate
    visit candidate_path(candidate.id)
    click_link 'Nova candidatura'
    expect(page).to have_button 'Enviar'
  end

end
