# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#
require 'rails_helper.rb'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe "uniqueness" do
    before :each do
      create(:user)
    end

    it { should validate_uniqueness_of :session_token }
    it { should validate_uniqueness_of :username }
  end

  describe "find by credentials" do
    let!(:user) { create(:user) }

    context "if user not nil and password is correct" do
      it "should return user" do
        expect(User.find_by_credentials(user.username, user.password)).to eq(user)
      end
    end

    context "if username and password incorrect" do
      it "should return nil" do
        expect(User.find_by_credentials("wefawef", "notpassword")).to be(nil)
      end
    end
  end

end
