module CouchBlog
  class Post
    include SimplyStored::Couch

    attr_accessor :frontend

    property :title
    property :date, type: Date
    property :body

    validates :title, length: {minimum: 4}
    validates :date, presence: true

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
