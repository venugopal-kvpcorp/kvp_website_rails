module ::Refinery
  class SitemapController < ::Refinery::FastController
    layout nil

    def index
      # headers['Content-Type'] = 'application/xml'
      
      @force_seo = true

      respond_to do |format|
        format.html do 
          @locales = Refinery::I18n.frontend_locales
          render :layout => "sitemap_layout"
        end
        format.xml do
          @locales = Refinery::I18n.frontend_locales
        end
      end
    end

  end
end
