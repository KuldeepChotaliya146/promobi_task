require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe 'DELETE /api/v1/courses/:id' do
    let!(:course) { create(:course, name: 'Test Course') }

    it 'delete coure' do
      delete "/api/v1/courses/#{course.id}"
      json_response = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(json_response["messageType"]).to eq("success")
      expect(Course.count).to eq(0)
    end
  end
end