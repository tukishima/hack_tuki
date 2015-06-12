class Picture < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  mount_uploader :backup, BackupUploader
end
