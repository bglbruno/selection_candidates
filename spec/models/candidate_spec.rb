require 'rails_helper'

RSpec.describe Candidate, type: :model do

  describe 'Associations' do
    it { is_expected.to have_one :knowledge_assessment }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
  end

  describe 'Nested Attributes' do
    it { is_expected.to accept_nested_attributes_for :knowledge_assessment }
  end
  
  let(:candidate) { build :candidate }

  describe 'Send Feedback' do
    
    it 'expect to send frond-end email' do
      mail = FeedbackCandidatesMailer.front_end(candidate.email)
      expect{candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(1) 
      expect(mail.body.encoded).to match(I18n.t('programmer.front_end'))
    end

    it 'expect to send back-end email' do
      mail = FeedbackCandidatesMailer.front_end(candidate.email)
      expect{candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(1) 
      expect(mail.body.encoded).to match(I18n.t('programmer.back_end'))
    end

    it 'expect to send mobile email' do
      mail = FeedbackCandidatesMailer.front_end(candidate.email)
      expect{candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(1) 
      expect(mail.body.encoded).to match(I18n.t('programmer.mobile'))
    end

    it 'expect to send generic email' do
      mail = FeedbackCandidatesMailer.front_end(candidate.email)
      expect{candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(1) 
      expect(mail.body.encoded).to match(I18n.t('programmer.generic'))
    end
  end

end
