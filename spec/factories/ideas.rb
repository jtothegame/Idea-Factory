FactoryGirl.define do
  factory :idea do
    sequence(:title) { |t| "Cool Idea Title #{t}" }
    body 'Some description of this idea'
  end
end
