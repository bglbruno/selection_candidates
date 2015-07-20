class Candidate
  include Mongoid::Document
  field :name, type: String
  field :email, type: String

  has_one :knowledge_assessment, dependent: :delete, autosave: true

  validates_presence_of :name, :email
  accepts_nested_attributes_for :knowledge_assessment

  def send_feedback
    FeedbackCandidatesMailer.front_end(email).deliver_now if knowledge_assessment.is_front_end?
    FeedbackCandidatesMailer.back_end(email).deliver_now if knowledge_assessment.is_back_end?
    FeedbackCandidatesMailer.mobile(email).deliver_now if knowledge_assessment.is_mobile?
    FeedbackCandidatesMailer.generic(email).deliver_now if knowledge_assessment.is_generic?
  end
end
