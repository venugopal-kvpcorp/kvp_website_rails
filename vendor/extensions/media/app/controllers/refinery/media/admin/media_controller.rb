module Refinery
  module Media
    module Admin
      class MediaController < ::Refinery::AdminController

        crudify :'refinery/media/medium',
                :xhr_paging => true

      end
    end
  end
end
