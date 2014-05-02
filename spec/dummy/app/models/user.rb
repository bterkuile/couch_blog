class User
  include SimplyStored::Couch

  #property :email
  devise :database_authenticatable, :recoverable, :rememberable, :trackable
  property :is_admin, type: :boolean

  validates_presence_of :email
end
