require 'rails_helper'

def login(user)
  visit login_path
  fill_in 'Username', with: user.username
  fill_in 'Password', with: user.password
  click_on 'Log In'
end

shared_examples_for 'user capabilities on articles' do
  before do
    login(user)
    visit articles_path
  end

  it "can manage all articles" do
    %w(Show Edit Destroy).each do |link|
      if abilities.include? link.downcase
        expect(page).to have_link link
      else
        expect(page).not_to have_link link
      end
    end
  end
end

feature "Articles", :type => :feature do
  let!(:article) {create(:article)}
  let!(:another_article) {create(:article)}
  context "When not logged in" do
    before {visit articles_path}
    it "allow guest to read all articles" do
      expect(page).to have_link 'Show'
    end
    it "disallow guest to edit/destroy any article" do
      expect(page).not_to have_link 'Edit'
      expect(page).not_to have_link 'Destroy'
    end
  end

  context "When login as admin" do
    let(:user) {create(:user)}
    let(:abilities) {%w{show}}
    it_should_behave_like 'user capabilities on articles'
  end
  context "When login as normal user" do
    let(:user) {create(:admin)}
    let(:abilities) {%w{show edit destroy}}
    it_should_behave_like 'user capabilities on articles'
  end
end
