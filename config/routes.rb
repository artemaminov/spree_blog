Spree::Core::Engine.add_routes do
  # Add your extension routes here

  namespace :blog do
    resources :posts, only: [:index, :show]
  end

  namespace :admin do
    namespace :blog do
      resources :posts, except: [:show] do
        resources :images, except: [:show], defaults: {format: :js}
      end
    end
  end

  root to: 'blog/posts#index'

end
