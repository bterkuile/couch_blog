module CouchBlog
  class Post
    include SimplyStored::Couch

    attr_accessor :frontend

    property :title
    property :date, type: Date
    property :body

    validates :title, length: {minimum: 4}
    validates :date, presence: true


    # VIEWS
    view :by_date, key: :date
    view :by_keyword_id, type: :custom, map_function: %|function(doc){
      if(doc.ruby_class == 'CouchBlog::Post' && doc.keyword_ids && doc.keyword_ids.length){
        doc.keyword_ids.forEach(function(keyword_id){ emit([keyword_id, doc.date], 1)})
      }
    }|, reduce_function: :_sum

    # SCOPES
    def self.active(date = Date.today)
      database.view(by_date(startkey: date, reduce: false, include_docs: true, descending: true))
    end

    def self.find_all_by_keyword_id(keyword_id, options = {})
      date = options.delete(:date).presence || Date.today
      database.view(by_keyword_id(startkey: [keyword_id, date], endkey: [keyword_id, {}], reduce: false, include_docs: true))
    end

    def to_param
      title.present? && frontend.present? ? "#{id}/#{title.parameterize}" : id
    end

    def keywords
      []
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
