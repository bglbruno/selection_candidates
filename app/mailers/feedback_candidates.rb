class FeedbackCandidates < ApplicationMailer

  def front_end(email)
    @greeting = I18n.t('feedback_candidates.message.content') 
    mail to: email, subject: I18n.t('feedback_candidates.message.subject') 
  end
  
  def back_end(email)
    @greeting = I18n.t('feedback_candidates.message.content') 
    mail to: email, subject: I18n.t('feedback_candidates.message.subject') 
  end

  def mobile(email)
    @greeting = I18n.t('feedback_candidates.message.content') 
    mail to: email, subject: I18n.t('feedback_candidates.message.subject') 
  end

  def default(email)
    @greeting = I18n.t('feedback_candidates.message.content') 
    mail to: email, subject: I18n.t('feedback_candidates.message.subject') 
  end
end
