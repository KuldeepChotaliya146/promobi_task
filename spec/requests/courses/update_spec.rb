require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  let!(:course) { create(:course, name: 'Test Course') }
  let(:valid_attributes) do
    {
      "name": "Ruby on Rails"
    }
  end
  let(:invalid_attributes) do
    {
      "name": ""
    }
  end

  describe 'PATCH /api/v1/courses/:id' do
    context 'with valid parameters' do
      it 'updates a course' do
        patch "/api/v1/courses/#{course.id}", params: { course: valid_attributes }
        json_response = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(json_response["messageType"]).to eq("success")
        expect(json_response["data"]["attributes"]["name"]).to eq("Ruby on Rails")
      end
    end

    context 'with invalid parameters' do
      it 'should not update course' do
        patch "/api/v1/courses/#{course.id}", params: { course: invalid_attributes }
        json_response = JSON.parse(response.body)
        expect(json_response["messageType"]).to eq("error")
        expect(response.status).to eq(422)
        expect(json_response["data"]).to eq([])
      end
    end
  end
end