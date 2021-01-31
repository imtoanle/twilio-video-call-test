class TokensController < ApplicationController
  def create
    token = Twilio::JWT::AccessToken.new(
      Rails.application.credentials.twilio[:account_sid],
      Rails.application.credentials.twilio[:api_key],
      Rails.application.credentials.twilio[:api_secret],
      [],
      identity: params[:identity]
    )

    grant = Twilio::JWT::AccessToken::VideoGrant.new
    token.add_grant(grant)

    render plain: token.to_jwt
  end
end
