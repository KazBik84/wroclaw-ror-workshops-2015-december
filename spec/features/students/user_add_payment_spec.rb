require 'spec_helper'

feature "User add payment to the student" do
  let!(:student) { create :student, first_name: 'Krzysztof', last_name: 'Jerzyna' }

  background do 
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path 
    find(:xpath, "//a[@title='Add payment']").click
  end

  scenario "Page should have proper breadscrumb" do
    within('.breadcrumbs') do

      expect(page).to have_content('RoR Workhops » Students » Krzysztof Jerzyna new payment')
    end
  end
  scenario 'with valid input' do
      fill_in 'Amount', with: '100'
      select '2015', from: 'payment_date_1i'
      select 'January', from: 'payment_date_2i'
      select '3', from: 'payment_date_3i'
      click_button 'Create Payment'
      expect(page).to have_content 'Payment has been created!'
  end    
 
  scenario 'without amount' do
    click_button 'Create Payment'
    expect(page).to have_content "can't be blank"
  end

end