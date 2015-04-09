Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :press_releases do
    resources :press_releases, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :press_releases, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :press_releases, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
