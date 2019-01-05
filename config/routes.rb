Rails.application.routes.draw do
  scope '/api' do
    namespace :v1 do
      shallow do
        resources :authors do
          resources :publications, except: :index
        end
        get 'publications', to: 'publications#index'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
