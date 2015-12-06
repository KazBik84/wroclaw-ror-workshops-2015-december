puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

15.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

10.times do
  Student.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birthdate: Faker::Date.between(10.years.ago, Date.today)
    )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

students.each do |student|
  month_array = (1..12).to_a.shuffle
  rand(1..12).times do |payment|
    rand_month = month_array.pop
    rand_day = rand(1..31)
    student.payments.create( {date: "2015-#{rand_month}-#{rand_day}", amount: "100" } )  
  end
end

puts "Seeds: done"
