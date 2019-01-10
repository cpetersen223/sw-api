require 'swagger_helper'

describe 'Publications API' do
  path '/api/v1/publications' do
    get 'Retrieves all publications or all with specific query options' do
      tags 'Publications'
      produces 'application/json'
      parameter name: :q, in: :query, type: :string
      response '200', :OK do
        schema type: :array,
               items: {
                   properties: {
                       id: { type: :integer },
                       title: { type: :string },
                       body: { type: :string },
                       author: {
                           type: :object,
                           items: {
                               properties: {
                                   id: { type: :string },
                                   name: { type: :string },
                                   email: { type: :string },
                                   birth_date: { type: :string }
                               },
                               required: %w[id name email birth_date]
                           }
                       }
                   }
               },
               required: %w[id body title author]

        let(:publications) { create_list(:publication, 10, nil, title: 'Test') }
        let(:q) { 'Test' }
        run_test!
      end
      response '200', :OK do
        schema type: :array,
               properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   body: { type: :string },
                   author: {
                       type: :object,
                       items: {
                           properties: {
                               id: { type: :string },
                               name: { type: :string },
                               email: { type: :string },
                               birth_date: { type: :string }
                           },
                           required: %w[id name email birth_date]
                       }
                   }
               },
               required: %w[id body title author]

        let(:publications) { create_list(:publication, 10) }
        let(:q) { "" }
        run_test!
      end
    end
  end

  path '/api/v1/authors/{id}/publications' do
    post 'Creates a publication' do
      tags 'Publications'
      consumes 'application/json', 'application/x-www-form-urlencoded'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :publication,
                in: :body,
                schema: {
                    type: :object,
                    properties: {
                        title: { type: :string },
                        body: { type: :string }
                    },
                    required: %w[body title]
                }

      response '201', :Created do
        schema type: :object,
               properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   body: { type: :string },
                   author: {
                       type: :object,
                       items: {
                           properties: {
                               id: { type: :string },
                               name: { type: :string },
                               email: { type: :string },
                               birth_date: { type: :string }
                           },
                           required: %w[id name email birth_date]
                       }
                   }
               },
               required: %w[id title body]

        let(:id) { create(:author).id }
        let(:publication) { { title: 'This is a title', body: 'this is a body' } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:id) { create(:author).id }
        let(:publication) { { title: 'Just title' } }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        let(:publication) { { title: 'This is a title', body: 'this is a body' } }
        run_test!
      end
    end
  end

  path '/api/v1/publications/{id}' do
    get 'Retrieves a publication' do
      tags 'Publications'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', :OK do
        schema type: :object,
               properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   body: { type: :string },
                   author: {
                       type: :object,
                       items: {
                           properties: {
                               id: { type: :string },
                               name: { type: :string },
                               email: { type: :string },
                               birth_date: { type: :string }
                           },
                           required: %w[id name email birth_date]
                       }
                   }
               },
               required: %w[id title body]

        let(:id) { create(:publication).id }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/publications/{id}' do
    put 'Updates a publication' do
      tags 'Publications'
      parameter name: :id, in: :path, type: :string
      parameter name: :publication,
                in: :body,
                schema: {
                    type: :object,
                    properties: {
                        title: { type: :string },
                        body: { type: :string }
                    }
                }
      response '204', 'No Content' do
        let(:id) { create(:publication).id }
        let(:publication) { { title: 'This is a title', body: 'this is a body' } }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        let(:publication) { { title: 'This is a title', body: 'this is a body' } }
        run_test!
      end
    end
  end

  path '/api/v1/publications/{id}' do
    delete 'Deletes a publication' do
      tags 'Publications'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '204', 'No content' do
        let(:id) { create(:publication).id }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
