class FeedbackCandidatesMailerPreview < ActionMailer::Preview

  def front_end
    FeedbackCandidatesMailer.front_end(email_candidate)
  end

  def back_end
    FeedbackCandidatesMailer.back_end(email_candidate)
  end

  def mobile
    FeedbackCandidatesMailer.mobile(email_candidate)
  end

  def generic
    FeedbackCandidatesMailer.generic(email_candidate)
  end

  private 
  def email_candidate
    'candidate@exemplo.com'
  end

end
