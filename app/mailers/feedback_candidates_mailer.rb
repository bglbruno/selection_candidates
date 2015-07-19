class FeedbackCandidatesMailer < ApplicationMailer

  def front_end(email)
    @content = I18n.t('feedback_candidates.message.content', type: I18n.t('programmer.front_end'))
    mail to: email, subject: I18n.t('feedback_candidates.message.subject') 
  end
  
  def back_end(email)
    @content = I18n.t('feedback_candidates.message.content', type: I18n.t('programmer.back_end')) 
    mail to: email, subject: I18n.t('feedback_candidates.message.subject') 
  end

  def mobile(email)
    @content = I18n.t('feedback_candidates.message.content', type: I18n.t('programmer.mobile'))
    mail to: email, subject: I18n.t('feedback_candidates.message.subject') 
  end

  def generic(email)
    @content = I18n.t('feedback_candidates.message.content', type: I18n.t('programmer.generic'))
    mail to: email, subject: I18n.t('feedback_candidates.message.subject') 
  end
end
