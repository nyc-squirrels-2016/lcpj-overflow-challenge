require 'rails_helper'
RSpec.describe User do
  context "validations" do
    it { should validate_presence_of :username}
    it { should allow_value('poliphant').for(:username) }
    it { should validate_uniqueness_of :username}
  end
  context "relationships" do
    it { should have_many :questions }
    it { should have_many :answers }
    it { should have_many :comments }
  end
  it "user should be created user" do
    user = FactoryGirl.create(:user)
    expect(user).to eq user
  end
  it "user should have a username" do
    u = FactoryGirl.create(:user, username: "poliphant")
    expect(u.username).to eq("poliphant")
  end
end

