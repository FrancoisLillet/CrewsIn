class Enrollment < ApplicationRecord
  belongs_to :mate
  belongs_to :trip

  validates :mate_id, presence: true
  validates :trip_id, presence: true

  after_create :generate_summary_pdf

  def generate_summary_pdf
    Prawn::Document.generate('Crewlist.pdf') do
      text 'hello, world!'
    end
  end
end
