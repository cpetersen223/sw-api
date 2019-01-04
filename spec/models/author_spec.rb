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

require 'rails_helper'

RSpec.describe Author, type: :model do
  # Association test
  # ensure Author model has a 1:m relationship with the Publication model
  it { should have_many(:publications).dependent(:destroy) }
  # Validation tests
  # ensure columns name, email and birth_date are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:birth_date) }
end
