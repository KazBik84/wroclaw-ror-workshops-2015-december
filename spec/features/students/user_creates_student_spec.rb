require 'spec_helper'

feature 'User creates student' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    click_on 'Add new one'
  end

  scenario 'with valid input without birthdate' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
  end

  scenario 'with valid input and birthdate' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    select '1999', from: 'student_birthdate_1i'
    select 'January', from: 'student_birthdate_2i'
    select '3', from: 'student_birthdate_3i'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
  end  

  scenario 'with missing first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end
end
