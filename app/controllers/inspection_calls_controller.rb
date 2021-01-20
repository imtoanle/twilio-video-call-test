class InspectionCallsController < ApplicationController
  before_action :load_resources

  def index; end

  def adjuster; end

  def claimant; end

  private

  def load_resources
    @claim = Claim.find_by(token: params[:token])
  end
end
