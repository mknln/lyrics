Lyrics::Application.routes.draw do

  resources :queue_jobs, :only => [:create, :new, :show, :index]
  resources :job_errors, :only => [:show, :index, :destroy]

  resources :playlists do
    member do
      get "play"
      post "add_lyric"
    end

    get :autocomplete_lyric_printable_title, :on => :collection
  end


  resources :lyrics do
    collection do
      get 'search'
    end
  end

  root :to => 'lyrics#index'

end
