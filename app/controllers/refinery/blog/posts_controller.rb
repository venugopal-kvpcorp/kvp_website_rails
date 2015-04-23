module Refinery
  module Blog
    class PostsController < BlogController

      before_filter :find_all_blog_posts, :except => [:archive]
      before_filter :find_blog_post, :only => [:show, :comment, :update_nav]
      before_filter :find_tags
      before_filter :set_blog_instance_variable
      before_filter :allow_author

      respond_to :html, :js, :rss

      layout :resolve_layout

      def index
        if request.format.rss?
          @posts = Post.live.includes(:comments, :categories)
          # limit rss feed for services (like feedburner) who have max size
          @posts = Post.recent(params["max_results"]) if params["max_results"].present?
        end
        respond_with (@posts) do |format|
          format.html
          format.rss
        end
      end

      def show
        @comment = Comment.new

        @canonical = refinery.url_for(:locale => Refinery::I18n.current_frontend_locale) if canonical?

        @post.increment!(:access_count, 1)

        respond_with (@post) do |format|
          format.html { present(@post) }
          format.js { render :partial => 'post', :layout => false }
        end
      end

      def comment
        if (@comment = @post.comments.create(params[:comment])).valid?
          if Comment::Moderation.enabled? or @comment.ham?
            begin
              CommentMailer.notification(@comment, request).deliver
            rescue
              logger.warn "There was an error delivering a blog comment notification.\n#{$!}\n"
            end
          end

          if Comment::Moderation.enabled?
            flash[:notice] = t('thank_you_moderated', :scope => 'refinery.blog.posts.comments')
            redirect_to refinery.blog_post_url(params[:id])
          else
            flash[:notice] = t('thank_you', :scope => 'refinery.blog.posts.comments')
            redirect_to refinery.blog_post_url(params[:id],
                                      :anchor => "comment-#{@comment.to_param}")
          end
        else
          render :show
        end
      end

      def archive
        if params[:month].present?
          date = "#{params[:month]}/#{params[:year]}"
          archive_date = Time.parse(date)
          @date_title = ::I18n.l(archive_date, :format => '%B %Y')
          @posts = Post.live.by_month(archive_date).page(params[:page])
        else
          date = "01/#{params[:year]}"
          archive_date = Time.parse(date)
          @date_title = ::I18n.l(archive_date, :format => '%Y')
          @posts = Post.live.by_year(archive_date).page(params[:page])
        end
        respond_with (@posts)
      end

      def tagged
        if params[:tag_id].present?
          @tag = ActsAsTaggableOn::Tag.find(params[:tag_id])
        else
          @tag = ActsAsTaggableOn::Tag.find_by_name(params[:tag_name].titleize.downcase)
        end
        (redirect_to "/404" and return) if @tag.nil?
        @tag_name = @tag.name
        @posts = Post.live.tagged_with(@tag_name).page(params[:page])
        render :layout => "search_layout"
      end

    protected
      def canonical?
        Refinery::I18n.default_frontend_locale != Refinery::I18n.current_frontend_locale
      end

      def resolve_layout
        case action_name
        when "show"
          "article_layout"
        when "comment"
          "article_layout"
        else
          "blog_layout"
        end
      end

      def allow_author        
        @allow_author = ( Refinery::Setting.find_by_name("allow-author").value rescue false )
        @column_count = (@allow_author ? 6 : 4)
      end
    end
  end
end

