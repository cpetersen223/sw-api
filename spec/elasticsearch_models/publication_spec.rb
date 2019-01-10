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

RSpec.describe Publication, search: true, type: :request do

  let!(:sample_publications) { create_list :publication, 10, :reindex, title: 'Title with no word' }
  let!(:publications) { create_list :publication, 10, :reindex, title: 'Title with specific word' }

  describe 'GET publications with title params' do
    before { get '/api/v1/publications?q=specific' }

    context 'when request for some publications by his title' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all publications with -specific- word' do
        expect(json.size).to eq(10)
      end
    end
  end

  describe 'GET publications with title and pagination params' do
    before { get '/api/v1/publications?q=specific&page=1&per_page=1' }

    context 'when request for some publications by his title' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all publications with -specific- word' do
        expect(json.size).to eq(1)
      end
    end
  end
end
