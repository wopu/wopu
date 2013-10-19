class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :password, type: String

  has_many :helps, as: :helper

  validates_presence_of :name
end
