require 'rails_helper'

RSpec.describe TokensController, type: :controller do
  describe '#create' do
    let(:access_token) { double(:access_token) }

    before do
      allow(Rails.application.credentials).to receive(:twilio).and_return({
        account_sid: 'account_sid', api_key: 'api_key', api_secret: 'api_secret'
      }).exactly(3).times
    end

    specify do
      expect(Twilio::JWT::AccessToken).to receive(:new).with(
        'account_sid',
        'api_key',
        'api_secret',
        [],
        identity: "Identity Name"
      ).once.and_return(access_token)
      expect(access_token).to receive(:add_grant).once
      expect(access_token).to receive(:to_jwt).once.and_return('GeneratedCallAccessKey')

      post :create, params: { identity: "Identity Name" }, xhr: true

      expect(response.response_code).to eq 200
      expect(response.body).to eq 'GeneratedCallAccessKey'
    end
  end
end
