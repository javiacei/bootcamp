require 'rails_helper'

describe ExercisesController, type: :controller do
  let(:app) { create :application }
  let(:user) { create(:user) }
  let(:course) { create :course_with_exercises }

  let(:params) do
    {
      course_id: course.id,
      number: 1
    }
  end

  let(:input) do
    {
      data: {
        attributes: {
          url: 'https://github.com/javiacei/bootcamp'
        }
      }
    }
  end

  describe 'PUT/PATCH #update' do
    subject do
      put_params = params.merge(input)
      put :update, put_params
    end

    context 'When user is not authenticated' do
      it 'should return an unauthorized response' do
        expect(subject).to have_http_status(:unauthorized)
      end
    end

    context 'When user is authenticated' do
      before(:each) { authenticate app, user }

      context 'When no input' do
        let(:input) { {} }

        it 'should return 422' do
          subject

          expect(subject).to have_http_status(:unprocessable_entity)
          expect(subject).to match_response_schema(:json_api)

          obj = JSON.parse(subject.body, symbolize_names: true)
          expect(obj[:errors][0][:source][:pointer]).to eq('/data/attributes/url')
          expect(obj[:errors][0][:detail]).to eq("can't be blank")
          expect(obj[:errors][1][:source][:pointer]).to eq('/data/attributes/url')
          expect(obj[:errors][1][:detail]).to eq('invalid github url')
        end
      end

      context 'When input is invalid' do
        let(:input) do
          {
            data: {
              attributes: {
                url: 'https://invalid-url.com'
              }
            }
          }
        end

        it 'should return a 422 response' do
          subject

          expect(subject).to have_http_status(:unprocessable_entity)
          expect(subject).to match_response_schema(:json_api)

          obj = JSON.parse(subject.body, symbolize_names: true)
          expect(obj[:errors][0][:source][:pointer]).to eq('/data/attributes/url')
          expect(obj[:errors][0][:detail]).to eq('invalid github url')
        end
      end

      context 'When input is valid' do
        it 'should complete a user exercise' do
          expect(subject).to have_http_status(:ok)
          expect(subject).to match_response_schema(:json_api)

          obj = JSON.parse(subject.body, symbolize_names: true)
          expect(obj[:data][:id]).to_not be_nil
          expect(obj[:data][:attributes][:state]).to eq('done')
          expect(obj[:data][:attributes][:'resolution-url']).to eq('https://github.com/javiacei/bootcamp')
          expect(ExerciseStatus.count).to eq(1)
        end
      end
    end
  end
end
