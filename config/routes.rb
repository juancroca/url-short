UrlShort::Application.routes.draw do
  devise_for :users

  resources :url_resources, :only => [:new, :create, :show, :index]
  match ':id' => 'url_resources#short', :as => :short
  root :to => 'pages#landing'
end
