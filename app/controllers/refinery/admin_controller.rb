# Filters added to this controller apply to all controllers in the refinery backend.
# Likewise, all the methods added will be available for all controllers in the refinery backend.
module Refinery
  class AdminController < ::ActionController::Base
    include ::Refinery::ApplicationController
    helper ApplicationHelper
    helper Refinery::Core::Engine.helpers
    include Refinery::Admin::BaseController

  private
    def load_valid_templates
      @valid_layout_templates = Pages.layout_template_whitelist &
                                Pages.valid_templates('app', 'views', '{layouts,refinery/layouts}', '*html*')

      @valid_view_templates = Pages.valid_templates('app', 'views', '{pages,refinery/pages}', '*html*')
    end
  end
end
