require 'rails_helper'
RSpec.describe Question do
  context "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :body}
    it { should validate_presence_of :user}
    it { should allow_value('What is an Ajax?').for(:title) }
  end
  context "relationships" do
    it { should have_many :answers }
    it { should have_many :comments }
    it { should have_many :votes }
    it "should belong to a user" do
      q = FactoryGirl.create(:question)
      expect(q.user).to be_a(User)
    end
  end
end
