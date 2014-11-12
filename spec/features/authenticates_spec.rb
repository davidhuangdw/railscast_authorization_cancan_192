require 'rails_helper'

feature "Authenticates", :type => :feature do
  let(:user) {create(:user)}
  context "When not login" do
    it "can visit login link" do
      visit root_path
      click_link 'Login'
      expect(current_path).to eq(login_path)
    end

    it 'can login' do
      visit login_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on 'Log In'
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged in successfully')

      expect(page).not_to have_link('Login')
      expect(page).to have_link('Logout')
      expect(page).to have_link('Profile')
    end
  end

  context "when logged In" do
    let(:user) {create(:user)}
    before do
      visit login_path
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      click_on 'Log In'
    end

    it "can visit logout link" do
      visit root_path
      click_link 'Logout'
      expect(current_path).to eq(root_path)
    end

    it 'can logout' do
      visit logout_path
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Logged out successfully')

      expect(page).to have_link('Login')
      expect(page).not_to have_link('Logout')
      expect(page).not_to have_link('Profile')
    end
  end
end
