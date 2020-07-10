require 'rails_helper'

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
        survivor = 1

        before do
            get :show, params: {id: survivor}
        end

        it "returns a successful response" do
            expect(response).to be_successful
        end
    end

end
