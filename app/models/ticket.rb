# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  overdued    :boolean
#  sprint_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Ticket < ApplicationRecord
  enum state: %w[opened completed]

  belongs_to :sprint

  scope :actual, -> { where(overdued: false) }
  scope :ope, -> { where(overdued: false) }

  validates :name, :description, :due_date, presence: true
end
