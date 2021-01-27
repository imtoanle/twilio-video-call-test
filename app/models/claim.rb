class Claim < ApplicationRecord
  has_secure_token :token

  has_many_attached :images

  scope :by_claim_number, ->(direction=:asc) { order() }
end
