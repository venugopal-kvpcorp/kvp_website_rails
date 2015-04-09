module Refinery
  module PressReleases
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PressReleases

      engine_name :refinery_press_releases

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "press_releases"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.press_releases_admin_press_releases_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/press_releases/press_release'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PressReleases)
      end
    end
  end
end
