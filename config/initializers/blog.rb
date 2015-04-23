Refinery::Blog.configure do |config|
  # config.validate_source_url = false

  # config.comments_per_page = 10

  config.posts_per_page = 4

  config.post_teaser_length = 295

  config.share_this_key = "2d85a951-a539-4bca-b502-9260555e46af"

  # config.page_url = "/blog"
  
  # If you're grafting onto an existing app, change this to your User class
  # Refinery::Blog.user_class = "Refinery::User"
end
