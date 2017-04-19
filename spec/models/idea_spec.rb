require 'rails_helper'

RSpec.describe Idea, type: :model do
  def valid_attributes(new_attributes)
    attributes = {
      title: "Laptop",
      body: "Cool Computer"
    }

    attributes.merge(new_attributes)
  end

  describe "validations" do
    context "title" do
      it 'requires a title' do
        idea = Idea.new(valid_attributes({ title: nil }))
        expect(idea).to be_invalid
      end

      it 'capitalizes the title after getting saved' do
        idea = Idea.new(valid_attributes({ title: 'hello jello' }))
        idea.save
        expect(idea.title).to eq('Hello jello')
      end
    end

    context 'body' do
      it "requires a body" do
        idea = Idea.new(valid_attributes({ body: nil }))
        expect(idea).to be_invalid
      end
    end
  end
end
