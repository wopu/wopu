class Result
  include Mongoid::Document
  field :description, type: String
  mount_uploader :photo, ImageUploader

  belongs_to :need

end
