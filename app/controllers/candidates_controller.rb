class CandidatesController < ApplicationController

  def index
    @candidate = Candidate.new
    @candidate.knowledge_assessment = KnowledgeAssessment.new
  end
  
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      @candidate.send_feedback
      redirect_to @candidate, notice: I18n.t(:success, scope: :essages)
    else
      render :index
    end
  end

  def show
  end

  private
    def candidate_params
      params.require(:candidate).permit(:name, :email, knowledge_assessment_attributes: [:html, :css, :javascript, :django, :python, :dev_ios, :dev_android])
    end

end
