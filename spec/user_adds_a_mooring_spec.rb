require 'rails_helper'

feature "user adds a new mooring", %Q{
  As a user
  I want to add a verified gem
  So it can be rented and reviewed
} do

# I need to be signed in to do this.
# I must provide gem name and description.
# I need to see a success message if submission is successful.
# I need to see an error message if submission is unsuccessful.

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      login(@user)
      visit new_mooring_path
    end

    scenario 'user adds a new mooring' do
      rubygem = FactoryGirl.create(:ruby_gem)

      fill_in 'harbor', with: rubygem.name
      fill_in 'Description', with: rubygem.description
      click_on "Create Ruby gem"

      expect(page).to have_content('Success')
      expect(page).to have_content rubygem.name
    end

    scenario 'user enters incomplete ruby gem info' do

      click_on "Create Ruby gem"

      expect(page).to_not have_content('Success')
      expect(page).to have_content("can't be blank")
    end
  end

  scenario 'unauthenticated user cannot add ruby gem' do
    visit new_ruby_gem_path

    expect(page).to have_content('You need to sign in')
  end
end
