require 'carrierwave/orm/activerecord'

class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader # overrides photo
end