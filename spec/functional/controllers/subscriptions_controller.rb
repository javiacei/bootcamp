require 'rails_helper'

describe SubscriptionsController, type: :controller do
  let(:app) { create :application }
  let(:user) { create(:user) }
  let(:course) { create :course_with_exercises }

  describe 'POST #create' do
    subject { post :create, course_id: course.id }

    context 'When user is not authenticated' do
      it 'should return an unauthorized response' do
        expect(subject).to have_http_status(:unauthorized)
      end
    end

    context 'When user is authenticated' do
      before(:each) { authenticate app, user }

      it 'should return a created response' do
        expect(subject).to have_http_status(:create)
      end
    end
  end
end
