class Claim < ApplicationRecord
  has_secure_token :token

  validates :claim_number, presence: true
  validates :claimant_contact, presence: true, email: true
end
