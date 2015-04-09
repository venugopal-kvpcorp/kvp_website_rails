Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :media do
    resources :media, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :media, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :media, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
