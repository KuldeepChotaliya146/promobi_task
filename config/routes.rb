Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'application#index', format: :json
  namespace 'api' do
    namespace 'v1', defaults: { format: :json } do
      resources :courses
      resources :tutors
    end
  end
end
