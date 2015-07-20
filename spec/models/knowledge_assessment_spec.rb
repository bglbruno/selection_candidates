require 'rails_helper'

RSpec.describe KnowledgeAssessment, type: :model do

  describe 'Field types' do
    it { is_expected.to have_fields(:html, :css, :javascript, :python, :django, :dev_ios, :dev_android) }
    it { is_expected.to have_fields(:html, :css, :javascript, :python, :django, :dev_ios, :dev_android).of_type(Integer) }
  end

  describe 'Validations' do
    it { is_expected.to validate_numericality_of(:html) }
    it { is_expected.to validate_numericality_of(:css) }
    it { is_expected.to validate_numericality_of(:javascript) }
    it { is_expected.to validate_numericality_of(:python) }
    it { is_expected.to validate_numericality_of(:python) }
    it { is_expected.to validate_numericality_of(:django) }
    it { is_expected.to validate_numericality_of(:dev_ios) }
    it { is_expected.to validate_numericality_of(:dev_android) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:candidate) }
  end
  
  let(:front_end) { build :knowledge_assessment, :front_end }
  let(:back_end) { build :knowledge_assessment, :back_end }
  let(:mobile) { build :knowledge_assessment, :mobile }
  let(:generic) { build :knowledge_assessment, :generic }

  describe '#is_front_end?' do
    context 'when programmer is front-end' do
      it { expect(front_end.is_front_end?).to be true }
    end
    context 'when programmer is not front-end' do
      it { expect(back_end.is_front_end?).to be false }
    end
  end

  describe '#is_back_end?' do
    context 'when programmer is back-end' do
      it { expect(back_end.is_back_end?).to be true }
    end
    context 'when programmer is not back-end' do
      it { expect(mobile.is_back_end?).to be false }
    end
  end

  describe '#is_mobile?' do
    context 'when programmer is mobile' do
      it { expect(mobile.is_mobile?).to be true }
    end
    context 'when programmer is not mobile' do
      it { expect(generic.is_mobile?).to be false }
    end
  end

  describe '#is_generic?' do
    context 'when programmer is generic' do
      it { expect(generic.is_generic?).to be true }
    end
    context 'when programmer is not front-end' do
      it { expect(front_end.is_generic?).to be false }
    end
  end

end
