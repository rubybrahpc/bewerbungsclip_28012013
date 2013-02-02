# == Schema Information
#
# Table name: templates
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  from_user   :string(255)
#  for_company :string(255)
#  video       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  vorname     :string(255)
#  nachname    :string(255)
#

class Template < ActiveRecord::Base
  attr_accessible :for_company, :user_id, :video, :vorname, :nachname, :password, :password_confirmation

  has_secure_password

  validates :for_company, length: { maximum: 43 }
  validates :video, presence: true

  validates :password, presence: true, length: { minimum: 9 }
  validates :password_confirmation, presence: true

  belongs_to :user

  mount_uploader :video, VideoUploader
end
