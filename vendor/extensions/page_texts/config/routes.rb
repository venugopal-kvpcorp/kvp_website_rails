Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :page_texts do
    resources :page_texts, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :page_texts, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :page_texts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
