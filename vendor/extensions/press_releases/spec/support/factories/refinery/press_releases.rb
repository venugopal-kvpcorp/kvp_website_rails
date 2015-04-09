
FactoryGirl.define do
  factory :press_release, :class => Refinery::PressReleases::PressRelease do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

