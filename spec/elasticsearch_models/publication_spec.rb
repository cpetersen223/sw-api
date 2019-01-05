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

RSpec.describe Publication, elasticsearch: true do
  it 'should be indexed' do
    expect(described_class.__elasticsearch__.index_exists?).to be_truthy
  end
end
