require 'rails_helper'

RSpec.describe InspectionCallsController, type: :controller do
  describe '#adjuster' do
    specify do
      get :adjuster

      expect(response.response_code).to eq 200
      expect(response).to render_template(:adjuster)
    end
  end
end
