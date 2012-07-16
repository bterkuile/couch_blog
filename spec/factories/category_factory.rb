FactoryGirl.define do
  factory :category, class: CouchBlog::Category do
    sequence(:name){|n| "Category #{n}"}
    sequence(:created_at){|i| Time.zone.now + i.seconds} # ensure following created at
  end
end
