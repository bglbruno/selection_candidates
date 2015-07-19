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
            numericality: { even: true}, inclusion: { in: [0..10] }

  belongs_to :candidate
end
