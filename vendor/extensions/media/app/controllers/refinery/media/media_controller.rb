module Refinery
  module Media
    class MediaController < ::ApplicationController

      before_filter :authorize_refinery_user
      before_filter :find_all_media
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @medium in the line below:
        present(@page)
      end

      def show
        @medium = Medium.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @medium in the line below:
        present(@page)
      end

    protected

      def find_all_media
        @media = Medium.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/media").first
      end

    end
  end
end
