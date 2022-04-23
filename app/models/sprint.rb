# == Schema Information
#
# Table name: sprints
#
#  id         :integer          not null, primary key
#  name       :string
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Sprint < ApplicationRecord

  has_many :tickets

  validates :name, :start_date, :end_date, presence: true
end
