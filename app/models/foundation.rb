class Foundation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :mission
  field :population
  field :start_date, type: DateTime
  field :certified, type: Boolean, default: false

  mount_uploader :logo, ImageUploader

  embeds_one :contact_info
  belongs_to :category
  belongs_to :user
  has_many :needs
  has_many :helps, as: :helper

  accepts_nested_attributes_for :contact_info
  accepts_nested_attributes_for :user

  validates_presence_of :name
  validates_associated :user

  after_validation :handle_post_validation

  private
  def handle_post_validation
    unless self.errors[:user].nil?
      self.user.errors.each{ |attr,msg| self.errors.add(attr, msg)}
      self.errors.delete(:user)
    end
  end
end
