require 'rails_helper'

RSpec.describe V1::AuthorsSerializer, type: :serializer do
  let(:category) { create(:author) }
  let(:serializer) { described_class.new(category) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  let(:subject) { JSON.parse(serialization.to_json) }

  it 'includes the expected authors attributes' do
    expect(subject.keys).to contain_exactly('id', 'name', 'email', 'birth_date')
  end
end