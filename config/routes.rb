Lyrics::Application.routes.draw do

  resources :lyrics

  root :to => 'lyrics#index'

end
