class Help
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String

  belongs_to :need
  belongs_to :helper, polymorphic: true
end
