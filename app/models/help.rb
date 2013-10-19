class Help
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :accepted, type: Boolean, default: nil # nil = Pending
  field :suggested, type: Boolean, default: false

  belongs_to :need
  belongs_to :helper, polymorphic: true

  validates_presence_of :description
end
