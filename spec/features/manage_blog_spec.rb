describe 'Manage blog', type: :feature do
  # In order to manage the blog
  # As an admin user
  # I want to mange couch_blog using cmtool
  context 'having admin user' do
    before do
      @user.is_admin = true
      @user.save
      login_user
    end

    it 'should display index wihtout blog posts' do
      #CouchBlog::Post.stub(:all).and_return []
      visit '/blog/admin'
      page.should have_content  'No Posts found'
    end

    context 'having a post' do
      before do
        @post = create :post, title: 'Test Post'
      end

      it 'display post title in index' do
        visit '/blog/admin'
        page.should have_content 'Test Post'
      end

      it 'display edit form' do
        visit "/blog/admin/posts/#{@post.id}/edit"
        page.should have_selector "#edit_post_#{@post.id}"
      end
    end

  end

end
