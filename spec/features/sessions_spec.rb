require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  let!(:user) do
    User.create(name: 'John Doe',
                username: 'johndoe',
                email: 'johndoe@example.com',
                password: 'johndoe')
  end

  describe 'Log in' do
    before do
      visit login_path
    end

    it 'visits the login page' do
      have_link 'Log In', href: login_path
      have_link 'Register', href: signup_path
      have_link 'Home', href: root_path
      expect(page).to have_content('Login')
    end

    context 'if login information valid' do
      it 'logs in user' do
        fill_in 'Username', with: user.username
        click_button 'Log In'
        expect(page).to have_content("Right on #{user.name}. Welcome Back!")
        expect(current_path).to eq root_path
        have_link 'Home', href: root_path
        have_link 'Write An Article', href: new_article_path
        have_link 'Logout', href: logout_path
      end
    end

    context 'if login information unvalid' do
      it 'shows flash error' do
        fill_in 'Username', with: 'dracula'
        click_button 'Log In'
        expect(page).to have_content('You have typed a wrong user name!')
        expect(current_path).to eq(login_path)
      end
    end
  end

  describe 'Log out', type: :feature do
    before do
      visit login_path
      fill_in 'Username', with: user.username
      click_button 'Log In'
    end

    context 'when logged out' do
      before { click_on 'Logout' }
      it 'redirects to the home page' do
        expect(current_path).to eq(root_path)
        expect(page).to have_content("You have successfully logged out #{user.name}!")
      end
    end
  end
end
