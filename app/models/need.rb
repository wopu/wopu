class Need
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
end
