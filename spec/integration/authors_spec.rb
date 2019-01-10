require 'swagger_helper'

describe 'Authors API' do
  path '/api/v1/authors' do
    get 'Retrieves all authors' do
      tags 'Authors'
      produces 'application/json'
      response '200', :OK do
        schema type: :array,
               properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   email: { type: :string }
               },
               required: %w[id name email]

        let(:authors) { create_list(:author, 10) }
        run_test!
      end
    end
  end

  path '/api/v1/authors' do
    post 'Creates an author' do
      tags 'Authors'
      consumes 'application/json', 'application/x-www-form-urlencoded'
      produces 'application/json'
      parameter name: :author,
                in: :body,
                schema: {
                    type: :object,
                    properties: {
                        name: { type: :string },
                        email: { type: :string },
                        birth_date: {
                            type: :string,
                            format: 'DD-MM-YYYY'
                        },
                        publications: {
                            type: :array,
                            items: {
                                properties: {
                                    title: { type: :string },
                                    body: { type: :string }
                                },
                                required: %w[title body]
                            }
                        }
                    },
                    required: %w[name email birth_date]
                }

      response '201', :Created do
        let(:author) { {name: 'Some name', email: 'email@example.com', birth_date: Date.today - 18.years } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:author) { { name: 'Just name' } }
        run_test!
      end
    end
  end

  path '/api/v1/authors/{id}' do
    get 'Retrieves an author' do
      tags 'Authors'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', :OK do
        schema type: :object,
               properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   email: { type: :string },
                   birth_date: { type: :string }
               },
               required: %w[id name email birth_date]

        let(:id) { create(:author).id }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/authors/{id}' do
    put 'Updates an author' do
      tags 'Authors'
      consumes 'application/json', 'application/x-www-form-urlencoded'
      parameter name: :id, in: :path, type: :string
      parameter name: :author,
                in: :body,
                schema: {
                    type: :object,
                    properties: {
                        name: { type: :string },
                        email: { type: :string },
                        birth_date: {
                            type: :string,
                            format: 'DD-MM-YYYY'
                        }
                    }
                }

      response '204', 'No Content' do
        let(:id) { create(:author).id }
        let(:author) { {name: 'Some name', email: 'email@example.com', birth_date: Date.today - 18.years } }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        let(:author) { {name: 'Some name', email: 'email@example.com', birth_date: Date.today - 18.years } }
        run_test!
      end
    end
  end

  path '/api/v1/authors/{id}' do
    delete 'Deletes an author' do
      tags 'Authors'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'No content' do
        let(:id) { create(:author).id }
        run_test!
      end

      response '404', 'Not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
