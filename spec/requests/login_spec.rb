require 'rails_helper'

describe 'login', type: :request do
  context 'user enter correct username and password' do
    user = User.create(name: 'test_01', password: 'password', password_confirmation: 'password')
    it 'display message that user is logged in' do
      visit root_path
      fill_in 'name', with: 'test_01'
      fill_in 'password', with: 'password'
      click_button 'Login'
      expect(page).to have_selector('p', text: 'test_01')
    end
  end

  context 'user enter wrong password' do
    it 'display error message' do
      visit root_path
      fill_in 'name', with: 'test_01'
      fill_in 'password', with: 'stupid'
      click_button 'Login'
      expect(page).to have_selector('p', text: 'invalid')
    end
  end
end
