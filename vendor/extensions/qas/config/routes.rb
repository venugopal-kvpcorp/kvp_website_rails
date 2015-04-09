Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :qas do
    resources :qas, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :qas, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :qas, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
