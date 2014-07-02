class Image < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :info
end
