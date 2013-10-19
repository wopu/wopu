class Foundation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  embeds_one :contact_info
end