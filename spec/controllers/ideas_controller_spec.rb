require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let(:idea) {FactoryGirl.create(:idea)}
  let(:idea_1) {FactoryGirl.create(:idea)}

  describe 'Index Action' do
    it 'it assigns a variable for all the ideas' do
      idea
      idea_1
      get :index
      expect(assigns(:ideas)).to eq([idea, idea_1])
    end
  end

  describe 'New Action' do
     it 'assigns an instance variable' do
       get :new
       expect(assigns(:idea)).to be_a_new(Idea)
     end
  end

  describe 'create a idea' do
    context 'with valid attributes' do
      def valid_request
        post :create, params: {
                        idea: FactoryGirl.attributes_for(:idea)
                      }
      end

      it 'creates a new Idea in the database' do
        count_before = Idea.count
        valid_request
        count_after = Idea.count
        expect(count_after).to eq(count_before + 1)
      end
    end
  end
end
