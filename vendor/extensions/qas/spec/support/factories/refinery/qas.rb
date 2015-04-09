
FactoryGirl.define do
  factory :qa, :class => Refinery::Qas::Qa do
    sequence(:page_text) { |n| "refinery#{n}" }
  end
end

