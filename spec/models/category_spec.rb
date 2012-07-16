require 'spec_helper'

describe CouchBlog::Category do
  before :each do
    @category = create :category, name: 'test'
  end
  it "should return @category in .all call" do
    CouchBlog::Category.all.should == [@category]
  end
  
  describe :with_posts_count do
    it "should return an empty Hash when nothing is defined" do
      CouchBlog::Category.with_posts_count.should == {}
    end

    describe "a post exists" do
      before :each do 
        @post1 = create :post
      end
      it "should return an empty Hash when no link is made to the post" do
        CouchBlog::Category.with_posts_count.should == {}
      end

      it "should return a value hash when the post is linked to the category" do
        @post1.category_ids = [@category.id]
        @post1.save
        CouchBlog::Category.with_posts_count.should == {@category => 1}
      end
      it "should return a value hash using the category name as key when name_only is given" do
        @post1.category_ids = [@category.id]
        @post1.save
        CouchBlog::Category.with_posts_count(name_only: true).should == {@category.name => 1}
      end
    end
  end
end
