# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Publications', type: :request do
  let!(:publications) { create_list(:publication, 20) }
  let(:publication) { publications.first }
  let(:publication_id) { publication.id }

  describe 'GET /publications' do
    before { get '/api/v1/publications' }

    context 'when publications exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all publications' do
        expect(json.size).to eq(20)
      end
    end
  end

  describe 'GET publications/:id' do
    before { get "/api/v1/publications/#{publication_id}" }

    context 'when author publication exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the publication' do
        expect(json['title']).to eq(publication.title)
      end
    end

    context 'when publication does not exist' do
      let(:publication_id) { publications.last.id + 1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Publication/)
      end
    end
  end

  describe 'POST /authors/:author_id/publications' do
    let!(:author) { create(:author) }
    let(:author_id) { author.id }
    let(:valid_attributes) { { title: 'Some title', body: 'Some body' } }

    context 'when request attributes are valid' do
      before { post "/api/v1/authors/#{author_id}/publications", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/api/v1/authors/#{author_id}/publications", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT publications/:id' do
    context 'when publication exists' do
      before do
        @title = 'Publication title'
        @valid_attributes = { title: @title }
        put "/api/v1/publications/#{publication_id}", params: @valid_attributes
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the publication' do
        updated_publication = Publication.find(publication_id)
        expect(updated_publication.title).to match(/#{@title}/)
      end
    end

    context 'when the publication does not exist' do
      before do
        @title = 'Publication title'
        @valid_attributes = { title: @title }
        put "/api/v1/publications/#{publications.last.id + 1}", params: @valid_attributes
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Publication/)
      end
    end
  end

  describe 'DELETE /authors/:id' do
    before { delete "/api/v1/publications/#{publication_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end