FactoryGirl.define do
  factory :item, class: 'Items' do
    sequence(:name) { |n| "Item#{n}" }
    sequence(:description) { |n| "Dolores voluptatem earum eligendi aut.#{n}"}
    sequence(:image_url) { |n| "https://robohash.org/velautea#{n}.png?size=300x300&set=set1" }
  end
end
