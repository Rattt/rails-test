class Book < ActiveRecord::Base
  
  before_save :generate_timestamp

  validates :name, presence: true, uniqueness: true

  mount_uploader :cover_image, BookImageUploader

  def generate_timestamp
    self.create_at = DateTime.now
  end

end
