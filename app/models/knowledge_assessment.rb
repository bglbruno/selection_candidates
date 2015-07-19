class KnowledgeAssessment
  include Mongoid::Document
  field :html, type: Integer
  field :css, type: Integer
  field :javascript, type: Integer
  field :python, type: Integer
  field :django, type: Integer
  field :dev_ios, type: Integer
  field :dev_android, type: Integer


  validates :html, :css, :javascript, :python, :django, :dev_ios, :dev_android,
            numericality: true

  belongs_to :candidate

  def is_front_end?
    points_for(html) && points_for(css) && points_for(javascript)
  end

  def is_back_end?
    points_for(python) && points_for(django)
  end

  def is_mobile?
    points_for(dev_ios) && points_for(dev_android)
  end

  def is_generic?
    !is_front_end? && !is_back_end? && !is_mobile?
  end

  private
    def points_for(points)
      (7..10).include?(points)
    end
end
