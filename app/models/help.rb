class Help
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :status # Pending, accepted, requested, verified/closed/received

  belongs_to :need
  belongs_to :helper, polymorphic: true

  validates_presence_of :description
end
