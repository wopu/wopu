class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :password, type: String

  mount_uploader :avatar, ImageUploader

  has_many :helps, as: :helper

  validates_presence_of :name, :email, :password

  def self.sign_in(params); where(params).first end
end
