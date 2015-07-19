class Candidate
  include Mongoid::Document
  field :name, type: String
  field :email, type: String

  validates_presence_of :name, :email

  has_one :knowledge_assessment, dependent: :delete, validate: true


  def send_feedback
    FeedbackCandidateMailer.front_end(email) if knowledge_assessment.is_front_end?
    FeedbackCandidateMailer.back_end(email) if knowledge_assessment.is_back_end?
    FeedbackCandidateMailer.mobile(email) if knowledge_assessment.is_mobile?
    FeedbackCandidateMailer.generic(email) if knowledge_assessment.is_generic?
  end
end
