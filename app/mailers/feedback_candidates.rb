class FeedbackCandidates < ApplicationMailer

  def front_end
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  
  def back_end
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def mobile
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def default
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
