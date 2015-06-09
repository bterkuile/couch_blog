RSpec.describe 'Show blog', type: :feature do
  before do
    @post = CouchBlog::Post.create title: 'My test blog post', body: 'My test blog post content', date: 1.day.ago.to_date
  end

  it 'should display index wihtout blog posts' do
    #CouchBlog::Post.stub(:all).and_return []
    visit "/blog"
    find('h1 a').click

    current_path.should eq "/blog/posts/#{@post.id}/my-test-blog-post"
  end

end
