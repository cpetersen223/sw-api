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
  belongs_to :author, optional: true
  validates :title, :body, presence: true
  alias_attribute :date, :created_at

  searchkick

  def self.search_for(string)
    return search(string)&.results if string

    ordered
  end

  def self.ordered
    order created_at: :desc
  end
end
