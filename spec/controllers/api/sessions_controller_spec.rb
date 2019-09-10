# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::SessionsController, type: :controller do
  let(:params) do
    { session: { email: "test@test.com", password: "test123" } }
  end

  before :each do
    request.headers["Accept"] = "application/json"
    allow(Sessions::Authenticate).to receive(:call)
  end

  describe "#authenticate" do
    it "calls the service to authenticate the user" do
      expect(Sessions::Authenticate).to receive(:call)
      post :authenticate, params: params
    end
  end
end
