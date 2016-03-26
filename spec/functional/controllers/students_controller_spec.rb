require 'rails_helper'

describe StudentsController, type: :controller do
  let(:app) { create :application }
  let(:user) { create(:user) }

  describe 'GET #show' do
    subject { get :show, id: user.id }

    context 'When user is not authenticated' do
      it 'should return an unauthorized response' do
        expect(subject).to have_http_status(:unauthorized)
      end
    end

    context 'When user is authenticated' do
      before(:each) { authenticate app, user }

      it 'should return a correct response' do
        expect(subject).to have_http_status(:ok)
      end
    end

    it 'should return a valid json-api format response' do
      expect(subject).to match_response_schema(:json_api)
    end
  end
end
