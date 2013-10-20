class Tag
  include Mongoid::Document

  belongs_to :available_tag
  belongs_to :taggeable, polymorphic: true

  delegate :name, to: :available_tag, allow_nil: true
end
