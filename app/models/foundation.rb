class Foundation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :mission
  field :population

  embeds_one :contact_info
end