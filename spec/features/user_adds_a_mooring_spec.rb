require 'rails_helper'

feature "user adds a new mooring", %Q{
  As a user
  I want to add a mooring
  So it can be rented and reviewed
} do

# I need to be signed in to do this.
# I must provide gem name and description.
# I need to see a success message if submission is successful.
# I need to see an error message if submission is unsuccessful.

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      @harbor = FactoryGirl.create(:harbor)
      @mooring = FactoryGirl.build(:mooring)
      visit '/'
      click_on 'Sign In'
      fill_in 'useremail', with: @user.email
      fill_in 'userpassword', with: @user.password
      click_button 'Sign In'
      visit new_mooring_path
    end

    scenario 'user adds a new mooring' do
      select(@harbor.name)
      select(@harbor.state)
      fill_in 'mooringprice', with: @mooring.price
      fill_in 'mooringLong', with: @mooring.longitude
      fill_in 'mooringLat', with: @mooring.latitude
      click_on 'addmooring'

      expect(page).to have_content('Success')
      expect(page).to have_content @mooring.latitude
      expect(page).to have_content @mooring.longitude
      expect(page).to have_content @mooring.price


    end

    scenario 'user enters incomplete mooring info' do

      click_on "Add Mooring"

      expect(page).to_not have_content('Success')
      expect(page).to have_content("can't be blank")
    end
  end

  scenario 'unauthenticated user cannot add mooring' do
    visit new_mooring_path

    expect(page).to have_content('You need to sign in')
  end
end
