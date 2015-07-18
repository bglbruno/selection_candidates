class FeedbackCandidatesPreview < ActionMailer::Preview

  def front_end
    FeedbackCandidates.front_end(email_candidate)
  end

  def back_end
    FeedbackCandidates.back_end(email_candidate)
  end

  def mobile
    FeedbackCandidates.mobile(email_candidate)
  end

  def default
    FeedbackCandidates.default(email_candidate)
  end

  private 
  def email_candidate
    'candidate@exemplo.com'
  end

end
