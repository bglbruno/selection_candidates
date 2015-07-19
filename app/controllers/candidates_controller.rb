class CandidatesController < ApplicationController

  def index
    @candidate = Candidate.new
  end
  
  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.valid?
      redirect_to @candidate, notice: I18n.t(:success, scope: :essages)
    else
      render :index
    end
  end

  def show

  end

  private
    def candidate_params
      params.require(:candidate).permit(:name, :email, :knowledge_assessment)
    end

end
