require 'rails_helper'
require 'faker'

RSpec.describe Api::ReportsController, type: :controller do
    describe "GET#index" do
        before do
            get :index
        end

        it "returns a successful response" do
            expect(response).to be_successful
        end
    end
end