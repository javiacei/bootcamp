require 'rails_helper'

describe BootcampsController, type: :controller do
  let(:app) { create :application }
  let(:user) { create(:user) }

  describe 'GET #index' do
    subject { get :index }

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
  end
end
