class Need
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :purpose # What for?
  field :description, type: String # The petition
  field :status # Open, close
  field :beneficiary, type: Integer
  # field :category ??? Money, time. knowledge, food
  # field :recurrent ??? Always exists? e.g. Money
  # See what happened after the need was marked as close? Show results?
  # May have a deadline?

  belongs_to :foundation
  has_many :helps

  validates_presence_of :description
end
