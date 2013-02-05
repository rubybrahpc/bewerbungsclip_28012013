# == Schema Information
#
# Table name: templates
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  from_user       :string(255)
#  for_company     :string(255)
#  video           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  vorname         :string(255)
#  nachname        :string(255)
#  password_digest :string(255)
#  bosskey         :string(255)
#

class Template < ActiveRecord::Base
  attr_accessible 	:for_company, 
  					:user_id,
            :from_user, 
  					:video, 
  					:vorname, 
  					:nachname, 
  					:password, 
  					:password_confirmation, 
  					:bosskey,
  					:fingerprint

  has_secure_password

  before_save :create_remember_token

  validates :for_company, length: { maximum: 45 }
  validates :video, presence: true

  validates :password, presence: true, length: { minimum: 9 }
  validates :password_confirmation, presence: true

  belongs_to :user

  mount_uploader :video, VideoUploader

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end