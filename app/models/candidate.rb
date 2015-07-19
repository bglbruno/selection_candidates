class Candidate
  include Mongoid::Document
  field :name, type: String
  field :email, type: String

  validates_presence_of :name, :email

  has_one :knowledge_assessment, dependent: :delete, validate: true
end
