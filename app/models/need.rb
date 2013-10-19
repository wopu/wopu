class Need
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description, type: String
  field :status # Open, close

  belongs_to :foundation
  has_many :helps

  validates_presence_of :description
end
