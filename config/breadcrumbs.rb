crumb :root do
  link 'RoR Workhops', root_path
end

crumb :students do
  link t('navbar.students'), students_path
end
crumb :student do |student|
  link "#{student.first_name} #{student.last_name}", student_path(student)
  parent :students
end

crumb :student_subjects do |student|
  link "#{student.first_name} #{student.last_name} #{t('shared.subjects')}", student_subjects_path(student)
  parent :students
end

crumb :student_payments do |student|
  link "#{student.first_name} #{student.last_name} payments", student_payments_path(student)
  parent :students
end

crumb :student_new_payment do |student|
  link "#{student.first_name} #{student.last_name} new payment", new_student_payment_path(student)
  parent :students
end

crumb :teachers do
  link t('navbar.teachers'), teachers_path
end

crumb :teacher do |teacher|
  link "#{teacher.academic_title} #{teacher.first_name} #{teacher.last_name}", teacher_path(teacher)
  parent :teachers
end

crumb :teacher_subjects do |teacher|
  link "#{teacher.first_name} #{teacher.last_name} #{t('shared.subjects')}", teacher_subjects_path(teacher)
  parent :teachers
end

crumb :subjects do
  link t('navbar.reports_subjects'), report_subjects_path
end

crumb :payments_list do
  link t('navbar.payments'), payments_list_path
end

crumb :payment do |student, payment|
  link "#{student.first_name} #{student.last_name} payment", student_payment_path(student, payment)
  parent :payments_list
end
