# == Schema Information
#
# Table name: authors
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  email      :string(255)
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ApplicationRecord
  has_many :publications, -> { order(created_at: :desc) }, dependent: :destroy
  validates :name, :email, :birth_date, presence: true
  accepts_nested_attributes_for :publications
end
