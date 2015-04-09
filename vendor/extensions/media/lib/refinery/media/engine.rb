module Refinery
  module Media
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Media

      engine_name :refinery_media

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "media"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.media_admin_media_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/media/medium'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Media)
      end
    end
  end
end
