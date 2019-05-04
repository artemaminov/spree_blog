Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :blog do
    resources :posts, only: [:index, :show]
  end

  namespace :admin do
    namespace :blog do
      resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

  root to: 'blog/posts#index'

end
