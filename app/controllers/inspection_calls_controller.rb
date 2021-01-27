class InspectionCallsController < ApplicationController
  before_action :load_resources

  def index; end

  private

  def load_resources
    @@claim = Claim.find_by(token: params[:token])
  end
end
