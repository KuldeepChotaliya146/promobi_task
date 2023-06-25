require 'rails_helper'

RSpec.describe 'Tutors', type: :request do
  describe 'GET /index' do
    let!(:course1) { create(:course) }
    let!(:course2) { create(:course) }
    let!(:tutor1) { create(:tutor, course: course1) }
    let!(:tutor2) { create(:tutor, course: course2) }

    it 'returns all Tutors' do
      get '/api/v1/tutors'
      json_response = JSON.parse(response.body)
      expect(json_response["data"].length).to eq(2)
      expect(Tutor.count).to eq(2)
      expect(response).to have_http_status(:success)
    end
  end
end