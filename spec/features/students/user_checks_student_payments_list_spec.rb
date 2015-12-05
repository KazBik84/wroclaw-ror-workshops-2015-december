require 'spec_helper'

feature 'User checks student details' do
  let!(:student) { create :student, first_name: 'Zbyszek', last_name: 'Jerzyna' }
  let!(:payment1){ create :payment, date: "2015-02-22", student_id: student.id }
  let!(:payment2){ create :payment, amount: "101", student_id: student.id }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    find(:xpath, "//a[@title='Show payments']").click
  end

  scenario "it has proper breadcrumb" do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students » Zbyszek Jerzyna payments'
    end
  end

  scenario "it shows all payments" do
    expect(page).to have_content "2015-02-22"
    expect(page).to have_content "101"
  end

end