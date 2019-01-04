class User < ApplicationRecord
  has_secure_password
  has_many :items, class_name: "item", foreign_key: "reference_id"
end
