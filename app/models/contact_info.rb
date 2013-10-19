class ContactInfo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :phone
  field :address

  embedded_in :foundation
end