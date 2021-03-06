# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CouchBlog::Admin::PostsController do

  # This should return the minimal set of attributes required to create a valid
  # CouchBlog::Post. As you add validations to CouchBlog::Post, be sure to
  # update the return value of this method accordingly.
  before :each do
    @user.is_admin = true
    @user.save
    sign_in @user
    @routes = CouchBlog::Engine.routes
  end

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = create :post
      get :index
      assigns(:posts).should =~ [post]
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = create :post
      get :show, :id => post.id
      assigns(:post).should eq(post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new
      assigns(:post).should be_a_new(CouchBlog::Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      post = create :post
      get :show, :id => post.id
      get :edit, :id => post.id
      assigns(:post).should eq(post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CouchBlog::Post" do
        expect {
          post :create, :post => build(:post).attributes
        }.to change(CouchBlog::Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        attributes = build(:post).attributes
        post :create, :post => attributes 
        assigns(:post).should be_a(CouchBlog::Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, :post => build(:post).attributes
        response.should redirect_to([:admin, CouchBlog::Post.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect_any_instance_of( CouchBlog::Post ).to receive(:save).and_return(false)
        post :create, :post => {title: ''}
        assigns(:post).should be_a_new(CouchBlog::Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect_any_instance_of( CouchBlog::Post ).to receive(:save).and_return(false)
        post :create, :post => {title: ''}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        post = create :post

        # Assuming there are no other posts in the database, this
        # specifies that the CouchBlog::Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of( CouchBlog::Post ).to receive(:update_attributes).with('title' => 'Yahoooooooo')
        put :update, :id => post.id, :post => {'title' => 'Yahoooooooo'}
      end

      it "assigns the requested post as @post" do
        post = create :post
        put :update, :id => post.id, :post => post.attributes
        assigns(:post).should eq(post)
      end

      it "redirects to the post" do
        post = create :post
        put :update, :id => post.id, :post => post.attributes
        response.should redirect_to([:admin, post])
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        post = create :post
        # Trigger the behavior that occurs when invalid params are submitted
        expect_any_instance_of( CouchBlog::Post ).to receive(:save).and_return(false)
        put :update, :id => post.id, :post => {title: ''}
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        post = create :post
        # Trigger the behavior that occurs when invalid params are submitted
        expect_any_instance_of( CouchBlog::Post ).to receive(:save).and_return(false)
        put :update, :id => post.id, :post => {title: ''}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      post = create :post
      expect {
        delete :destroy, :id => post.id
      }.to change(CouchBlog::Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = create :post
      delete :destroy, :id => post.id
      response.should redirect_to(admin_posts_path)
    end
  end

end
