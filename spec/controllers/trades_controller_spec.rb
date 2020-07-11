require 'rails_helper'
require 'faker'

RSpec.describe Api::TradesController, type: :controller do
    describe "POST#create" do
        context "with valid attributes" do
            let(:valid_attributes) do
                {
                    sender: Faker::Number.between(from: 1, to: 100),
                    receiver: Faker::Number.between(from: 1, to: 100),
                    item_id_sender: Faker::Number.between(from: 1, to: 100),
                    item_id_receiver: Faker::Number.between(from: 1, to: 100),
                    quantity_receiver: Faker::Number.between(from: 1, to: 100),
                    quantity_sender: Faker::Number.between(from: 1, to: 100)
                }
            end

            it "creates a new survivor" do
                expect {
                    post :create, params: {trade: valid_attributes}
                }.to change(Trade, :count).by(0)
            end
        end

        context "with invalid attributes" do
            let(:invalid_attributes) do
                {
                    sender: Faker::Number.between(from: 1, to: 100),
                    receiver: Faker::Number.between(from: 1, to: 100),
                    item_id_sender: Faker::Number.between(from: 1, to: 100),
                    item_id_receiver: Faker::Number.between(from: 1, to: 100),
                    quantity_receiver: Faker::Number.between(from: 1, to: 100),
                    quantity_sender: Faker::Number.between(from: 1, to: 100)
                }
            end

            it "does not create a new survivor" do
                expect {
                    post :create, params: {survivor: invalid_attributes}
                }.not_to change(Trade, :count)
            end
        end
    end
end