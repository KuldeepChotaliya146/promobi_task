require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  let(:valid_attributes) do
    {
      "name": "Ruby on Rails",
      "tutors_attributes": [
          {
              "first_name": "Kuldeep",
              "last_name": "Chotaliya"
          },
          {
              "first_name": "Abhishek",
              "last_name": "Kumar"
          }

      ]
    }
  end

  let(:invalid_attributes) do
    {
      "name": "",
      "tutors_attributes": [
          {
              "first_name": "Kuldeep",
              "last_name": "Chotaliya"
          },
          {
              "first_name": "Abhishek",
              "last_name": "Kumar"
          }

      ]
    }
  end

  describe 'POST /api/v1/courses' do
    context 'with valid parameters' do
      it 'creates a course with tutors' do
        post '/api/v1/courses', params: { course: valid_attributes }
        json_response = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(json_response["messageType"]).to eq("success")
        expect(Course.count).to eq(1)
        expect(Course.last.name).to eq('Ruby on Rails')
        expect(Course.last.tutors.count).to eq(2)
      end
    end

    context 'with invalid parameters' do
      it 'should not create course' do
        post '/api/v1/courses', params: { course: invalid_attributes }
        json_response = JSON.parse(response.body)
        expect(json_response["messageType"]).to eq("error")
        expect(response.status).to eq(422)
        expect(Course.count).to eq(0)
        expect(Tutor.count).to eq(0)
      end
    end
  end
end