require 'rails_helper'

RSpec.describe 'Tutors', type: :request do
  let!(:tutor) { create(:tutor, first_name: 'Kuldeep') }
  let(:valid_attributes) do
    {
      "first_name": "Tanjiro",
      "last_name": "Kamado"
    }
  end
  let(:invalid_attributes) do
    {
      "first_name": ""
    }
  end

  describe 'PATCH /api/v1/tutors/:id' do
    context 'with valid parameters' do
      it 'updates a tutor' do
        patch "/api/v1/tutors/#{tutor.id}", params: { tutor: valid_attributes }
        json_response = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(json_response["messageType"]).to eq("success")
        expect(json_response["data"]["attributes"]["first_name"]).to eq("Tanjiro")
      end
    end

    context 'with invalid parameters' do
      it 'should not update tutor' do
        patch "/api/v1/tutors/#{tutor.id}", params: { tutor: invalid_attributes }
        json_response = JSON.parse(response.body)
        expect(json_response["messageType"]).to eq("error")
        expect(response.status).to eq(422)
        expect(json_response["data"]).to eq([])
      end
    end
  end
end