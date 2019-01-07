require 'rails_helper'

RSpec.describe V1::PublicationSerializer, type: :serializer do
  let(:category) { create(:publication) }
  let(:serializer) { described_class.new(category) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  let(:subject) { JSON.parse(serialization.to_json) }

  it 'includes the expected publication attributes' do
    expect(subject.keys).to contain_exactly('title', 'body', 'created_at', 'author')
  end

  it 'includes the expected publications attributes' do
    expect(subject['author'].keys).to contain_exactly('name', 'email', 'birth_date')
  end
end