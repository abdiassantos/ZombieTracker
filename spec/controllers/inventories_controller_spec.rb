require 'rails_helper'
require 'faker'

RSpec.describe Api::InventoriesController, type: :controller do
    describe "GET#index" do
        before do
            get :index
        end
        
        it "returns a successful response" do
            expect(response).to be_successful
        end
    end

    # describe "GET#show" do
    #     let(:inventory){create(:inventory)}

    #     before do
    #         get :show, params: {id: inventory.id}
    #     end

    #     it "returns a successful response" do
    #         expect(response).to be_successful
    #     end
    # end

    describe "POST#create" do
        context "with valid attributes" do
            let(:valid_attributes) do
                {
                    quantity: Faker::Number.between(from: 1, to: 1000),
                    item_id: Faker::Number.between(from: 1, to: 4),
                    survivor_id: Faker::Number.between(from: 1, to: 1)
                }
            end

            it "creates a new inventory" do
                expect {
                    post :create, params: {inventory: valid_attributes}
                }.to change(Inventory, :count).by(0)
            end
        end

        context "with invalid attributes" do
            let(:invalid_attributes) do
                {
                    quantity: Faker::Number.between(from: 1, to: 1000),
                    item_id: Faker::Number.between(from: 1, to: 4),
                    survivor_id: Faker::Number.between(from: 1, to: 1) 
                }
            end

            it "does not create a new inventory" do
                expect {
                    post :create, params: {inventory: invalid_attributes}
                }.not_to change(Inventory, :count)
            end
        end
    end
end
