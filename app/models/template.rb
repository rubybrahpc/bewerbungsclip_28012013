class Template < ActiveRecord::Base
  attr_accessible :for_company, :user_id, :video, :vorname, :nachname

  belongs_to :user

  mount_uploader :video, VideoUploader
end
