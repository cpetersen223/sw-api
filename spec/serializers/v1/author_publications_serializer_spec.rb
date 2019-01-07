require 'rails_helper'

RSpec.describe V1::AuthorPublicationsSerializer, type: :serializer do
  let(:category) { create(:publication) }
  let(:serializer) { described_class.new(category) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  let(:subject) { JSON.parse(serialization.to_json) }

  it 'includes the expected publication attributes' do
    expect(subject.keys).to contain_exactly('body', 'title', 'created_at')
  end
end