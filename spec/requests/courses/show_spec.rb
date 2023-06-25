require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe 'GET /api/v1/courses/:id' do
    let!(:course) { create(:course, name: 'Test Course') }

    it 'returns coure' do
      get "/api/v1/courses/#{course.id}"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["messageType"]).to eq("success")
      expect(json_response["data"]["attributes"]["name"]).to eq("Test Course")
    end
  end
end