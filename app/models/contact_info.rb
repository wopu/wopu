class ContactInfo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :phone
  field :address
  field :email

  embedded_in :foundation
end