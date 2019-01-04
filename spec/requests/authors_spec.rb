# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  let!(:authors) { create_list(:author, 10) }
  let(:author) { authors.first }
  let(:author_id) { author.id }

  describe 'GET /api/v1/authors' do
    before { get '/api/v1/authors' }

    it 'returns all authors' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/authors/:id' do
    before { get "/api/v1/authors/#{author_id}" }

    context 'when the record exists' do
      it 'returns the specific author' do
        expect(json).not_to be_empty
        expect(json['name']).to eq(author.name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:author_id) { authors.last.id + 1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Author with 'id'=#{author_id}/)
      end
    end
  end

  describe 'POST /api/v1/authors' do
    let(:name) { 'John Doe' }
    let(:email) { 'test@example.org' }
    let(:birth_date) { Date.today - 18.years }
    let(:valid_attributes) { { name: name, email: email, birth_date: birth_date } }

    context 'when the request is valid' do
      before { post '/api/v1/authors', params: valid_attributes }

      it 'creates an author' do
        expect(json['name']).to eq(name)
        expect(json['email']).to eq(email)
        expect(json['birth_date'].to_date).to eq(birth_date)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/authors', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /api/v1/authors/:id' do
    let(:valid_attributes) { { name: 'John Doe' } }

    context 'when the record exists' do
      before { put "/api/v1/authors/#{author.id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /api/v1/authors/:id' do
    before { delete "/api/v1/authors/#{author.id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
