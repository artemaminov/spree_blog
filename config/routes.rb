Spree::Core::Engine.add_routes do
  # Add your extension routes here
  scope "blog", as: "blog" do
    resources :posts, only: [:index, :show]
  end

  namespace :admin do
    scope "blog", as: "blog" do
      resources :posts, only: [:index, :new, :create, :edit, :update, :destroy]
    end
  end

end
