require 'spec_helper'

feature "User add payment to the student" do
  let!(:student) { create :student, first_name: 'Krzysztof', last_name: 'Jerzyna' }

  background do 
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
      puts page.body    
    find(:xpath, "//a[@title='Add payment']").click
  end

  scenario "Page should have proper breadscrumb" do
    within('.breadcrumbs') do

      expect(page).to have_content('RoR Workhops » Students » Jan Nowak payments')
    end
  end
    

end