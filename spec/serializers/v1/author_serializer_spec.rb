require 'rails_helper'

RSpec.describe V1::AuthorSerializer, type: :serializer do
  let(:category) { create(:author_with_publications) }
  let(:serializer) { described_class.new(category) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  let(:subject) { JSON.parse(serialization.to_json) }

  it 'includes the expected author attributes' do
    expect(subject.keys).to contain_exactly('name', 'email', 'birth_date', 'publications')
  end

  it 'includes the expected publications attributes' do
    expect(subject['publications'].sample.keys).to contain_exactly('title', 'body', 'created_at')
  end
end