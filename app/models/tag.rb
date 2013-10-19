class Tag
  include Mongoid::Document

  belongs_to :available_tag
  belongs_to :thing, polymorphic: true
end
