# == Schema Information
#
# Table name: publications
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  date       :date
#  time       :time
#  author_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Publication < ApplicationRecord
  belongs_to :author
  validates :title, :body, :date, :time, presence: true
end
