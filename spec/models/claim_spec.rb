require 'rails_helper'

RSpec.describe Claim, type: :model do
  describe '.validations' do
    let(:claim) { build :claim, claim_number: "CN", claimant_contact: "test@example.com" }

    context 'when all attributes are correctly' do
      specify do
        expect(claim.valid?).to be true
        expect(claim.errors.full_messages).to be_empty
      end
    end

    context 'when claim_number is nil' do
      before { claim.claim_number = nil }

      specify do
        expect(claim.valid?).to be false
        expect(claim.errors.full_messages).to eq ["Claim number can't be blank"]
      end
    end

    context 'when claimant_contact is nil' do
      before { claim.claimant_contact = nil }
      
      specify do
        expect(claim.valid?).to be false
        expect(claim.errors.full_messages).to match_array([
          "Claimant contact can't be blank",
          "Claimant contact is not an email"
        ])
      end
    end

    context 'when claimant_contact is not email' do
      before { claim.claimant_contact = 'wrongemail' }
      
      specify do
        expect(claim.valid?).to be false
        expect(claim.errors.full_messages).to eq ["Claimant contact is not an email"]
      end
    end
  end
end
