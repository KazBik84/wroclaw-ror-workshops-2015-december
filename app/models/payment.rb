class Payment < ActiveRecord::Base
  belongs_to :student

  validates :date, :amount, presence: true
  validates_numericality_of :amount

end
