module CouchBlog
  class Category
    include SimplyStored::Couch
    property :name
    has_and_belongs_to_many :posts, storing_keys: false

    view :by_post_count, type: :raw, map_function: %|function(doc){
      if(doc.ruby_class == 'CouchBlog::Post' && doc.category_ids && doc.category_ids.length){
        doc.category_ids.forEach(function(category_id){ emit([category_id, doc.date], 1)})
      }
    }|, reduce_function: :_sum

    # SCOPES

    # Return a Hash having categories as key and the number of posts having the category as value
    # if :name_only is given as option the result will be a hash with category names as keys:
    #   CouchBlog::Cateogry.with_posts_count name_only: true
    # =>
    #   {
    #     'news' => 2,
    #     'tech' => 5
    #   }
    # This can be used to populate a categories word cloud. Notice that categories having 0 posts 
    # will not be present in the resultset.
    def self.with_posts_count(options = {})
      result = Array.wrap(database.view(by_post_count(reduce: true, group_level: 1))['rows']).compact
      name_only = options.delete(:name_only)
      return {} unless result.any?
      res = {}
      result.each do |row|
        category = all.find{|c| c.id == row['key'].first}
        res[name_only ? category.name : category] = row['value']
      end
      res 
    end
  end
end
