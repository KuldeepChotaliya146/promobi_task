require 'rails_helper'

RSpec.describe 'Tutors', type: :request do
  let!(:course) { create(:course) }
  let(:valid_attributes) do
    {
      "first_name": "Kyojoro",
      "last_name": "Rengoku",
      "course_id": course.id
    }
  end

  let(:invalid_attributes) do
    {
      "first_name": "",
    }
  end

  describe 'POST /api/v1/tutors' do
    context 'with valid parameters' do
      it 'creates a tutor' do
        post '/api/v1/tutors', params: { tutor: valid_attributes }
        json_response = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(json_response["messageType"]).to eq("success")
        expect(Tutor.count).to eq(1)
        expect(Tutor.last.first_name).to eq('Kyojoro')
      end
    end

    context 'with invalid parameters' do
      it 'should not create tutor' do
        post '/api/v1/tutors', params: { tutor: invalid_attributes }
        json_response = JSON.parse(response.body)
        expect(json_response["messageType"]).to eq("error")
        expect(response.status).to eq(422)
        expect(Tutor.count).to eq(0)
      end
    end
  end
end