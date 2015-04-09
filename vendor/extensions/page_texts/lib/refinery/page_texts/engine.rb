module Refinery
  module PageTexts
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::PageTexts

      engine_name :refinery_page_texts

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "page_texts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.page_texts_admin_page_texts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/page_texts/page_text',
            :title => 'key'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::PageTexts)
      end
    end
  end
end
