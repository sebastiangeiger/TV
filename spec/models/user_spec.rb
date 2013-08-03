require 'spec_helper'

describe User do

  describe ".create" do
    subject { User.new(hash) }
    context 'with email and password' do
      let(:hash) do
        { email: "test@example.com",
          password: "test" }
      end
      it { should be_valid }
    end
    context 'without password' do
      let(:hash) do
        { email: "test@example.com" }
      end
      it { should_not be_valid }
    end
    context 'without email' do
      let(:hash) do
        { password: "test" }
      end
      it { should_not be_valid }
    end
    context 'when another user already exists' do
      before(:each) do
        User.create(email: "other_user@example.com", password: "test")
      end
      context 'and I choose another email' do
        let(:hash) do
          { email: "test@example.com",
            password: "test1" }
        end
        it { should be_valid }
      end
      context 'and I choose the same email' do
        let(:hash) do
          { email: "other_user@example.com",
            password: "test2" }
        end
        it { should_not be_valid }
      end
    end
  end

  describe "#authenticate" do
    let(:user) { FactoryGirl.create(:user, password: "12345") }
    subject { user.authenticate(password) }
    context 'with the valid password' do
      let(:password) { "12345" }
      it { should be user }
    end
    context 'with an invalid password' do
      let(:password) { "abcde" }
      it { should be false }
    end
  end

  describe ".for_email" do
    subject { User.for_email(email) }
    context 'when asking for the user by his email' do
      let(:email) { user.email }
      let(:user) { FactoryGirl.create(:user, email: "test@example.com") }
      it { should == user }
    end
    context 'when asking for a non existing user' do
      let(:email) { "does_not_exist@example.com" }
      it { should be_present }
      it { should be_a NonExistingUser }
    end
    context 'when asking for nil' do
      let(:email) { "does_not_exist@example.com" }
      it { should be_present }
    end
  end

  describe ".for_credentials" do
    subject { User.for_credentials(email: email, password: password) }
    let!(:user) { FactoryGirl.create(:user, email: correct_email, password: correct_password) }
    let(:correct_email) { "test@example.com" }
    let(:correct_password) { "correctPassword" }
    context 'when passing the right email and password' do
      let(:email) { correct_email }
      let(:password) { correct_password }
      it { should == user }
    end
    context 'when passing the wrong email' do
      let(:email) { "other_user@example.com" }
      let(:password) { correct_password }
      it { should be_a NonExistingUser }
    end
    context 'when passing the wrong password' do
      let(:email) { correct_email }
      let(:password) { "wrongPassword" }
      it { should be_a NonExistingUser }
    end
  end
end
