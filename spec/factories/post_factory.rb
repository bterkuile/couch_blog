FactoryGirl.define do
  factory :post, class: CouchBlog::Post do
    sequence(:title){|n| "Test CouchBlog::Post #{n}"}
    sequence(:date){|n| Date.today }
    sequence(:created_at){|i| Time.zone.now + i.seconds} # ensure following created at
  end
end
