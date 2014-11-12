require 'rails_helper'

feature "Signups", :focus, :type => :feature do
  before {visit signup_path}
  it "should allow to check each role" do
    User::ROLES.each do |role|
      expect(page).to have_selector "\##{role}[type=checkbox]"
    end
  end
end
