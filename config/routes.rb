StructuredText::Application.routes.draw do
  resources :users
  resources :documents
  resources :sections

  match ":id", :to => "users#show"
  match ":user/:id", :to => "documents#show"
  match ":user/:document/:id", :to => "sections#show"
end