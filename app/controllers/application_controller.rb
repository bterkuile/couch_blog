require 'spec_helper'

describe CouchBlog::Cateogry do
  before :each do
    @category = create :category, name: 'test'
  end

  describe 'Getting' do
    it "should return all categories through all" do
      CouchBlog::Category.all.should == [@category]
    end
  end

  describe :with_posts_count do
    describe 'without any posts' do
      it "should return an empty hash" do
        CouchBlog::Category.with_posts_count.should == {}
      end
    end
    desribe 'with one post' do
      before :each do
        @post1 = create :post
      end
      it "should return an empty hash" do
        CouchBlog::Category.with_posts_count.should == {}
      end

      it "should return a hash having the category with value 1 when linked" do
        @post1.categories = [@category]
        @post1.save
        CouchBlog::Category.with_posts_count.should == {@category => 1}
      end

      it "should replace category with name as key when name_only is given" do
        @post1.categories = [@category]
        @post1.save
        CouchBlog::Category.with_posts_count.should == {@category.name => 1}
      end
    end
  end
end
