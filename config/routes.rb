Lyrics::Application.routes.draw do

  resources :playlists do
    member do
      get "play"
      post "add_lyric"
    end
  end


  resources :lyrics do
    collection do
      get 'search'
    end
  end

  root :to => 'lyrics#index'

end
