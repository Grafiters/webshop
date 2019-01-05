class Item < ApplicationRecord
    mount_uploader :image,ImageUploader
    has_many :items, class_name: "object", foreign_key: "reference_id"
end
