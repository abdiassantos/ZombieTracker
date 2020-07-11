require 'rails_helper'
require 'faker'

RSpec.describe Api::SurvivorsController, type: :controller do
    describe "GET#index" do
        before do
            get :index
        end
        
        it "returns a successful response" do
            expect(response).to be_successful
        end
    end

    describe "GET#show" do
        let(:survivor){create(:survivor)}

        before do
            get :show, params: {id: survivor.id}
        end

        it "returns a successful response" do
            expect(response).to be_successful
        end
    end

    describe "POST#create" do
        context "with valid attributes" do
            let(:valid_attributes) do
                {
                    name: Faker::Name.name,
                    age: Faker::Number.between(from: 1, to: 100), 
                    gender: Faker::Gender.short_binary_type,
                    latitude: Faker::Address.latitude,
                    longitude: Faker::Address.longitude,
                    infected: Faker::Boolean.boolean
                }
            end

            it "creates a new survivor" do
                expect {
                    post :create, params: {survivor: valid_attributes}
                }.to change(Survivor, :count).by(0)
            end
        end

        context "with invalid attributes" do
            let(:invalid_attributes) do
                {
                    name: Faker::Name.name,
                    age: Faker::Number.between(from: 1, to: 100), 
                    gender: Faker::Gender.short_binary_type,
                    latitude: Faker::Address.latitude,
                    longitude: Faker::Address.longitude,
                    infected: Faker::Boolean.boolean
                }
            end

            it "does not create a new survivor" do
                expect {
                    post :create, params: {survivor: invalid_attributes}
                }.not_to change(Survivor, :count)
            end
        end
    end

    # describe "GET#edit" do
    #     let(:survivor) { create(:survivor) }

    #     before do
    #         get :edit, params: { id: survivor.id }
    #     end

    #     it "returns a success response" do
    #         expect(response).to be_successful
    #     end
    # end

    describe "PUT#update" do
        let(:survivor) { create(:survivor) }

        context "when successful" do
            let(:survivor_attributes) { attributes_for(:survivor) }

            before do
                put :update, params: { id: survivor.id, survivor: survivor_attributes }
            end

            it "returns a redirect response" do
                expect(response).to be_successful
            end
        end

        context "when not successful" do
            let(:survivor_attributes) { attributes_for(:survivor, name: "") }

            it "does not update the survivor" do
                expect {
                    put :update, params: { id: survivor.id, survivor: survivor_attributes }
                }.not_to change { survivor.reload }
            end
        end
    end

    describe "DELETE#destroy" do
        let!(:survivor) { create(:survivor) }
    
        it "deletes a survivor" do
            expect {
                delete :destroy, params: { id: survivor.id }
            }.to change {
                Survivor.count
            }.by(-1)
        end

        it "returns a successful response" do
            delete :destroy, params: { id: survivor.id }
            expect(response).to be_successful
        end
    end
end
