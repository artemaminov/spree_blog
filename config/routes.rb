Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :blog do
    resources :posts, only: [:index, :show]
  end

  namespace :admin do
    namespace :blog do
      resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

end
