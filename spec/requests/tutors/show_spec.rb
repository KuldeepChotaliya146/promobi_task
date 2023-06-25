require 'rails_helper'

RSpec.describe 'Tutors', type: :request do
  describe 'GET /api/v1/tutors/:id' do
    let!(:tutor) { create(:tutor, first_name: 'Kuldeep') }

    it 'returns coure' do
      get "/api/v1/tutors/#{tutor.id}"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["messageType"]).to eq("success")
      expect(json_response["data"]["attributes"]["first_name"]).to eq("Kuldeep")
    end
  end
end