class ClaimMailer < ApplicationMailer
  def request_inspection_call
    @claim = params[:claim]
    @inspection_call_url = claimant_inspection_calls_url(token: @claim.token)

    mail(
      to: @claim.claimant_contact,
      subject: "#{@claim.claim_number}: Request Inspection Call"
    )
  end
end
