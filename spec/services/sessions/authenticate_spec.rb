# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sessions::Authenticate do
  subject { Sessions::Authenticate }
  let(:credentials) do
    { email: "test@test.com", password: "test123" }
  end
  let(:incorrect_credentials) do
    { email: "incorrect@test.com", password: "abc123" }
  end
  let!(:user) { create(:user) }

  describe ".authenticate" do
    context "when the credentials are correct" do
      it "returns a token" do
        response = subject.call(email: credentials[:email], password: credentials[:password])
        expect(response).not_to eq(nil)
        expect(response).not_to eq(:unauthorized)
      end
    end

    context "when the credentials are incorrect" do
      it "returns unauthorized" do
        expect(subject.call(email: incorrect_credentials[:email], password: incorrect_credentials[:password])).to eq(:unauthorized)
      end
    end
  end
end
