class Result
  include Mongoid::Document
  field :description, type: String
  mount_uploader :photo, ImageUploader

  belongs_to :need

  after_save :solve_need

  def solve_need
    need.solve!
  end
end
