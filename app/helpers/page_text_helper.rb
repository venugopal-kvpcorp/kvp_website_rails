# 1. Helper which access the refinery resources
# 2. Returns the value, based on the key and page given

module PageTextHelper

  def self.get_text_value(page, key)
    page_texts = Refinery::PageTexts::PageText.where(key: key, page: page)
    if page_texts.any?
      page_texts.first.value
    else
      "Text not found..!"
    end
  end

end

