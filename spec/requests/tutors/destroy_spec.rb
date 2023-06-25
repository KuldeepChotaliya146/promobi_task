require 'rails_helper'

RSpec.describe 'Tutors', type: :request do
  describe 'DELETE /api/v1/tutors/:id' do
    let!(:tutor) { create(:tutor) }

    it 'delete coure' do
      delete "/api/v1/tutors/#{tutor.id}"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["messageType"]).to eq("success")
      expect(Tutor.count).to eq(0)
    end
  end
end