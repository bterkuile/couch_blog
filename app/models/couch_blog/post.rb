module CouchBlog
  class Post
    include SimplyStored::Couch
    property :title
    property :date, type: Date
    property :body

    validates :title, length: {minimum: 4}
    validates :date, presence: true

    def to_param
      title.present? ? "#{id}/#{title.parameterize}" : id
    end
  end
end
