# 1. Returns the HTML for categories of given post

module HtmlHelper

  def self.get_categories_html(post, refinery_object)

    categories = post.categories
    count = categories.count
    case count

    when 0
      "<a href='/blog/categories/uncategorized'>Uncategorized</a>"
    when 1
      category = categories.first
      "<a href=#{refinery_object.blog_category_path(category)} >"+ category.title+"</a>"
    else
      category = categories.shift
      count = count-1
      categories_html = categories.map do |category|
        get_html_for_category(category, refinery_object)
      end
      .join("<br>")
      "<a href=#{refinery_object.blog_category_path(category)}>"+ category.title+"</a>" + "<i><a data-toggle='popover' data-trigger='focus' data-content='"+ categories_html +"'> .. </a></i>"
    end
  end

  def self.get_html_for_category(category, refinery_object)
    "<a href=#{refinery_object.blog_category_path(category)} class=\"category-link\" ><i class=\"fa fa-angle-right\"></i>&nbsp;"+category.title+"</a>"
  end

end