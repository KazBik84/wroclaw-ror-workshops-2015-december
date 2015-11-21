class AddStudentToSubjectItems < ActiveRecord::Migration
  def change
    add_reference :subject_items, :student, index: true
  end
end
