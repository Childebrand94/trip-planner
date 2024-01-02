FactoryBot.define do
  factory :note do
    trip
    author
    body { 'MyText' }
    completed { false }
  end
end
