require 'rails_helper'
RSpec.describe Answer do
  context "validations" do
    it { should validate_presence_of :body}
  end
  context "relationships" do
    it { should have_many :comments }
    it { should have_many :votes }
    it { should belong_to :user }
    it { should belong_to :question }
    it "should belong to a question" do
      a = FactoryGirl.create(:answer)
      expect(a.question).to be_a(Question)
    end
    it "should belong to a user" do
      a = FactoryGirl.create(:answer)
      expect(a.user).to be_a(User)
    end
  end
end
