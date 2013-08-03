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
    let(:user) { FactoryGirl.create(:user, email: "test@example.com") }
    subject { User.for_email(email) }
    context 'when asking for the user by his email' do
      let(:email) { user.email }
      it { should == user }
    end
    context 'when asking for a non existing user' do
      let(:email) { "does_not_exist@example.com" }
      it { should be_present }
      it { should be_a NonExistingUser }
    end
  end
end
