FactoryBot.define do
  factory :claim do
    sequence(:claim_number) { |n| "Claim NUM #{n}" }
    sequence(:claimant_contact) { |n| "person#{n}@example.com" }
  end
end
