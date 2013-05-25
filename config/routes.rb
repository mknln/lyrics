Lyrics::Application.routes.draw do

  resources :playlists


  resources :lyrics

  root :to => 'lyrics#index'

end
