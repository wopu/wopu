class Need
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String

  belongs_to :foundation
  has_many :helps

  validates_presence_of :description
end
