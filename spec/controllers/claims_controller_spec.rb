require 'rails_helper'

RSpec.describe ClaimsController, type: :controller do
  describe '#index' do
    let!(:claim) { create :claim }

    specify do
      get :index

      expect(response.response_code).to eq 200
      expect(response).to render_template(:index)
      expect(assigns(:claims)).to eq [claim]
    end
  end

  describe '#new' do
    specify do
      get :new

      expect(response.response_code).to eq 200
      expect(response).to render_template(:new)
      expect(assigns(:claim)).to be_an_instance_of(Claim)
    end
  end

  describe '#create' do
    let(:params) {
      { claim: { claim_number: "CN123", claimant_contact: "person@example.com" } }
    }

    subject { get :create, params: params }

    context 'when claim save success' do
      let(:mailer) { double(:claim_mailer) }

      specify do
        expect(ClaimMailer).to receive(:with).with(claim: anything).and_return(mailer)
        expect(mailer).to receive_message_chain('request_inspection_call.deliver')

        expect { subject }.to change(Claim, :count).by(1)

        expect(response).to redirect_to(adjuster_inspection_calls_path(token: assigns(:claim).token))
      end
    end

    context 'when claim save fail' do
      before { allow_any_instance_of(Claim).to receive(:save).and_return(false) }

      specify do
        expect { subject }.to change(Claim, :count).by(0)
        expect(response).to render_template(:new)
      end
    end
  end
end
