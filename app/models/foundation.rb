class Foundation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :mission
  field :population

  embeds_one :contact_info

  accepts_nested_attributes_for :contact_info

  has_many :needs
  has_many :helps, as: :helper

  validates_presence_of :name
end