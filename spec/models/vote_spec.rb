require 'rails_helper'
RSpec.describe Vote do
  context "relationships" do
    it { should belong_to :user }
    it { should belong_to :votable }
    it "should belong to a user" do
      v = FactoryGirl.create(:question_vote)
      expect(v.user).to  be_a(User)
    end
    it "should be able to belong to a question" do
      v = FactoryGirl.create(:question_vote)
      expect(v.votable).to be_a(Question)
    end
    it "should be able to belong to an answer" do
      v = FactoryGirl.create(:answer_vote)
      expect(v.votable).to be_a(Answer)
    end
  end
end
