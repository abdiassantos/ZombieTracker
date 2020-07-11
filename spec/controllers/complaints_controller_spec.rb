require 'rails_helper'
require 'faker'

RSpec.describe Api::ComplaintsController, type: :controller do
    describe "GET#index" do
        before do
            get :index
        end
        
        it "returns a successful response" do
            expect(response).to be_successful
        end
    end

    describe "GET#show" do
        let(:complaint){create(:complaint)}

        before do
            get :show, params: {id: complaint.id}
        end

        it "returns a successful response" do
            expect(response).to be_successful
        end
    end

    describe "POST#create" do
        context "with valid attributes" do
            let(:valid_attributes) do
                {
                    quantity: Faker::Number.between(from: 1, to: 1000),
                    survivor_id: Faker::Number.between(from: 1, to: 1)
                }
            end

            it "creates a new complaint" do
                expect {
                    post :create, params: {complaint: valid_attributes}
                }.to change(Complaint, :count).by(0)
            end
        end

        context "with invalid attributes" do
            let(:invalid_attributes) do
                {
                    quantity: Faker::Number.between(from: 1, to: 1000),
                    survivor_id: Faker::Number.between(from: 1, to: 1)
                }
            end

            it "does not create a new complaint" do
                expect {
                    post :create, params: {complaint: invalid_attributes}
                }.not_to change(Complaint, :count)
            end
        end
    end
end