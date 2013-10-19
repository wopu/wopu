class Need
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description, type: String
  field :status # Open, close
  # field :category ??? Money, time. knowledge, food
  # field :recurrent ??? Always exists? e.g. Money
  # See what happened after the need was marked as close? Show results?

  belongs_to :foundation
  has_many :helps

  validates_presence_of :description
end
