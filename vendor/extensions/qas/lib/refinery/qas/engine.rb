module Refinery
  module Qas
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Qas

      engine_name :refinery_qas

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "qas"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.qas_admin_qas_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/qas/qa',
            :title => 'page_text'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Qas)
      end
    end
  end
end
