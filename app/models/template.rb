class Template < ActiveRecord::Base
  attr_accessible :for_company, :user_id, :video, :vorname, :nachname

  validates :for_company, length: { maximum: 43 }
  validates :video, presence: true

  belongs_to :user

  mount_uploader :video, VideoUploader
end
