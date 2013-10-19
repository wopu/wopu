class Need
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :purpose # What for?
  field :description, type: String # The petition
  field :status # Open, close
  field :beneficiary, type: Integer
  field :deadline, type: DateTime
   # See what happened after the need was marked as close? Show results?
   #has_many :pictures

  belongs_to :foundation
  has_many :helps
  has_many :tags, as: :thing

  validates_presence_of :description
end
