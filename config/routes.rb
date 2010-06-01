StructuredText::Application.routes.draw do
  root :to => "documents#index"

  resources :users
  resources :documents
  resources :sections do
    collection do
      get :inplace
      post :inplace
    end
  end

  match ":id", :to => "users#show"
  match ":user/:id", :to => "documents#show"
  match ":user/:document/:id", :to => "sections#show"
end