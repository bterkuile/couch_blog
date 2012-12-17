require 'spec_helper'

describe CouchBlog::Post do
  before :each do
    @post = create :post
  end
  describe 'display only posts when publication date is today or in past' do
    it "should not include the post when the date is in the future" do
      CouchBlog::Post.active(Date.yesterday).should == []
    end
    it "should include the post for today" do
      CouchBlog::Post.active.should == [@post]
    end

    it "should include the post on future dates" do
      CouchBlog::Post.active(Date.tomorrow).should == [@post]
    end
  end
end
