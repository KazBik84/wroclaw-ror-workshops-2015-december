class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = student.subject_item_notes.where(subject_item_id: subject_item.id)
    avg_notes = notes.average(:value)
    if avg_notes == nil
      return "0.00"
    else
      avg = sprintf( "%0.02f", avg_notes)
    end
  end
end
