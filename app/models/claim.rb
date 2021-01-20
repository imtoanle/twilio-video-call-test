class Claim < ApplicationRecord
  has_secure_token :token

  has_many_attached :images
end
