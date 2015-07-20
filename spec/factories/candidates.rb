FactoryGirl.define do
  factory :candidate do
    name "Candidato"
    email "candidato@gmail.com"
    knowledge_assessment

    trait :invalid do
      name nil
    end
  end

end
