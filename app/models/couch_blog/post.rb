module CouchBlog
  class Post
    include SimplyStored::Couch

    attr_accessor :frontend

    property :title
    property :date, type: Date
    property :body

    validates :title, length: {minimum: 4}
    validates :date, presence: true

    has_and_belongs_to_many :categories, storing_keys: true

    # VIEWS
    view :by_date, key: :date
    view :by_category_id, type: :custom, map_function: %|function(doc){
      if(doc.ruby_class == 'CouchBlog::Post' && doc.category_ids && doc.category_ids.length){
        doc.category_ids.forEach(function(category_id){ emit([category_id, doc.date], 1)})
      }
    }|, reduce_function: :_sum

    # SCOPES
    def self.active(date = Date.today)
      database.view(by_date(endkey: date, reduce: false, include_docs: true))
    end

    def self.find_all_by_category_id(category_id, options = {})
      date = options.delete(:date).presence || Date.today
      database.view(by_category_id(startkey: [category_id, date], endkey: [category_id, {}], reduce: false, include_docs: true))
    end

    def to_param
      title.present? && frontend.present? ? "#{id}/#{title.parameterize}" : id
    end

    # Allow usage like:
    #   link_to '...', [post.for_frontend]
    # to activate named routing
    def for_frontend
      @frontend = true
      self
    end
  end
end
