
FactoryGirl.define do
  factory :page_text, :class => Refinery::PageTexts::PageText do
    sequence(:key) { |n| "refinery#{n}" }
  end
end

