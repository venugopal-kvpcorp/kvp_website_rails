module Refinery
  module PressReleases
    class PressReleasesController < ::ApplicationController

      # before_filter :authorize_refinery_user
      before_filter :find_all_press_releases
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @press_release in the line below:
        present(@page)
      end

      def show
        @press_release = PressRelease.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @press_release in the line below:
        present(@page)
      end

    protected

      def find_all_press_releases
        @press_releases = PressRelease.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/press_releases").first
      end


    end
  end
end
