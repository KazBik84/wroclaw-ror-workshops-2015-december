require 'spec_helper'

feature 'User checks student details' do
  let!(:student)  { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:student2) { create :student, first_name: 'Zbyszek', last_name: 'Jerzyna' } 

  let!(:payment)  { create :payment, date: "2015-01-12", student_id: student.id} 

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit payments_list_path
  end

  scenario "user can see students" do
    expect(page).to have_content "Jan"
    expect(page).to have_content "Zbyszek"    
  end

  scenario "month columnt are getting updated depend of the payments" do
    within("table#student_payments tbody tr:nth-of-type(1) td:nth-of-type(3)") do
      expect(page).to have_content "2015-01-12"
    end
    within("table#student_payments tbody tr:nth-of-type(1) td:nth-of-type(4)") do
      expect(page).to have_content "no"
    end    
  end

  scenario "the columns can be sorted by click", js: true do
    within("table#student_payments tbody tr:nth-of-type(1) td:nth-of-type(1)") do
      expect(page).to have_content "Jan"
    end
    within("table#student_payments tbody tr:nth-of-type(2) td:nth-of-type(1)") do
      expect(page).to have_content "Zbyszek"
    end      
    page.find('table#student_payments thead tr th:nth-of-type(1)', text: "first name").click
    within("table#student_payments tbody tr:nth-of-type(1) td:nth-of-type(1)") do
      expect(page).to have_content "Zbyszek"
    end
    within("table#student_payments tbody tr:nth-of-type(2) td:nth-of-type(1)") do
      expect(page).to have_content "Jan"
    end     
  end
end