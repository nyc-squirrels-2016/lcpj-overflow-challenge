require 'rails_helper'
RSpec.describe Comment do
  context "validations" do
    it { should validate_presence_of :body}
    it { should allow_value('An Ajax is an Ajax').for(:body) }
  end
  context "relationships" do
    it { should belong_to :commentable }
    it { should belong_to :user }
    it "should belong to a user" do
      c = FactoryGirl.create(:question_comment)
      expect(c.user).to be_a(User)
    end
    it "should be able to belong to a question" do
      c = FactoryGirl.create(:question_comment)
      expect(c.commentable).to be_a(Question)
    end
    it "should be able to belong to an answer" do
      c = FactoryGirl.create(:answer_comment)
      expect(c.commentable).to be_a(Answer)
    end
  end
end
