class AvailableTag
  include Mongoid::Document

  field :name, type: String

  has_many :tags

  validates_presence_of :name
end
