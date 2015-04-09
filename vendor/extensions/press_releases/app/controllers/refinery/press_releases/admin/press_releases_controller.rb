module Refinery
  module PressReleases
    module Admin
      class PressReleasesController < ::Refinery::AdminController

        crudify :'refinery/press_releases/press_release',
                :xhr_paging => true

      end
    end
  end
end
