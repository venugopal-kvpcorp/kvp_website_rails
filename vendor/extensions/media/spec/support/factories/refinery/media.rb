
FactoryGirl.define do
  factory :medium, :class => Refinery::Media::Medium do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

