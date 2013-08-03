require "spec_helper"

describe "Login" do
  let(:request) do
    post "/api/session", { email: email, password: password }, format: :json
  end
  subject { request; Response.new(response) }
  let(:email) { user.email }

  let!(:user) do
    FactoryGirl.create(:user, email: "test@example.com", password: "correctPassword")
  end

  context 'when trying with a valid user' do
    let(:password) { "correctPassword" }
    its(:status) { should == 200 }
  end
  context 'when trying with an invalid user' do
    let(:password) { "wrongPassword" }
    its(:status) { should == 401 }
  end
end

