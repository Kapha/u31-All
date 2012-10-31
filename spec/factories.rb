FactoryGirl.define do
  factory :user do
    sequence(:firstname) { |n| "First #{n}" }
    sequence(:sirname)   { |n| "Last #{n}" }
    sequence(:email)     { |n| "person_#{n}@example.com"}
    password    "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end
end