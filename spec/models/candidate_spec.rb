require 'rails_helper'

RSpec.describe Candidate, type: :model do

  describe 'Field types' do
    it { is_expected.to have_fields(:name, :email) }
    it { is_expected.to have_fields(:name, :email).of_type(String) }
  end

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
  let(:front_end) { build :knowledge_assessment, :front_end }
  let(:back_end) { build :knowledge_assessment, :back_end }
  let(:mobile) { build :knowledge_assessment, :mobile }
  let(:generic) { build :knowledge_assessment, :generic }

  describe 'Send Feedback' do

    it 'expect to send frond-end email' do
      candidate.knowledge_assessment = front_end
      candidate.send_feedback
      expect{candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(1) 
      expect( ActionMailer::Base.deliveries.last.body.encoded).to match(I18n.t('programmer.front_end'))
    end

    it 'expect to send back-end email' do
      candidate.knowledge_assessment = back_end
      candidate.send_feedback
      expect{candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(1) 
      expect( ActionMailer::Base.deliveries.last.body.encoded).to match(I18n.t('programmer.back_end'))
    end

    it 'expect to send mobile email' do
      candidate.knowledge_assessment = mobile
      candidate.send_feedback
      expect{candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(1) 
      expect( ActionMailer::Base.deliveries.last.body.encoded).to match(I18n.t('programmer.mobile'))
    end

    it 'expect to send generic email' do
      candidate.knowledge_assessment = generic
      candidate.send_feedback
      expect{candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(1) 
      expect( ActionMailer::Base.deliveries.last.body.encoded).to match(I18n.t('programmer.generic'))
    end
  end

end
