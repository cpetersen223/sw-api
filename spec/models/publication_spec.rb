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

require 'rails_helper'

RSpec.describe Publication, type: :model do
  # Association test
  # ensure a publication record belongs to a single author
  it { should belong_to(:author) }
  # Validation test
  # ensure column title, body, date and time are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
end
