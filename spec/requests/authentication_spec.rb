require "spec_helper"

describe "Login" do
  let(:request) do
    post "/api/session", email: email, password: password, format: :json
  end
  subject { request; Response.new(response) }
  let(:email) { user.email }

  let!(:user) do
    FactoryGirl.create(:user, email: "test@example.com", password: "correctPassword")
  end

  context 'when trying with a valid user' do
    let(:password) { "correctPassword" }
    its(:status) { should == 200 }
    its(:json) { should have_key "session_token" }
  end
  context 'when trying with an invalid user' do
    let(:password) { "wrongPassword" }
    its(:status) { should == 401 }
    its(:json) { should_not have_key "session_token" }
    its(:json) { should have_key "error" }
  end
end

describe "Checking the authoriziation" do
  let(:request) do
    get "/api/#{action}/testingthis", {format: :json}, auth_hash
  end
  subject { request; Response.new(response) }

  shared_examples_for "the user can access the action" do
    its(:status) { should == 200 }
    its(:json) { should have_key "text" }
    its(:json) { should_not have_key "error" }
    it 'returns the right text' do
      subject.json['text'].should == "The server replies: testingthis"
    end
  end

  shared_examples_for "the user cannot access the action" do
    its(:status) { should == 401 }
    its(:json) { should_not have_key "text" }
    its(:json) { should have_key "error" }
  end

  context "when not logged in" do
    let(:auth_hash) { Hash.new }
    context "with the unprotected action" do
      let(:action) { "echo" }
      it_behaves_like "the user can access the action"
    end
    context "with the protected action" do
      let(:action) { "protectedecho" }
      it_behaves_like "the user cannot access the action"
    end
  end

  context "when logged in" do
    let(:auth_hash) do
      { 'HTTP_AUTHORIZATION'=> %{Token token="#{session_token}"} }
    end
    let!(:session_token) do
      password = "correctPassword"
      email = "test@example.com"
      FactoryGirl.create(:user, email: email, password: password)
      post "/api/session", email: email, password: password, format: :json
      Response.new(response).json['session_token']
    end
    context "with the unprotected action" do
      let(:action) { "echo" }
      it_behaves_like "the user can access the action"
    end
    context "with the protected action" do
      let(:action) { "protectedecho" }
      it_behaves_like "the user can access the action"
    end
  end

  context "with the wrong session token"
end

