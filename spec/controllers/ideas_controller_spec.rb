require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let(:idea) {FactoryGirl.create(:idea)}
  let(:idea_1) {FactoryGirl.create(:idea)}

  describe 'create a idea' do
    context 'with valid attributes' do
      def valid_request
        post :create, params: {
                        idea: FactoryGirl.attributes_for(:idea)
                      }
      end
    end
  end
end
