FactoryGirl.define do
  factory :knowledge_assessment do
    html 0
    css 0
    javascript 0
    python 0
    django 0
    dev_ios 0
    dev_android 0

    trait :front_end do
      html 10
      css 10
      javascript 10
      python 0
      django 0
      dev_ios 0
      dev_android 0
    end

    trait :back_end do
      html 0
      css 0
      javascript 0
      python 10
      django 10
      dev_ios 0
      dev_android 0
    end

    trait :mobile do
      html 0
      css 0
      javascript 0
      python 0
      django 0
      dev_ios 10
      dev_android 10
    end

    trait :generic do
      html 1
      css 1
      javascript 1
      python 1
      django 1
      dev_ios 1
      dev_android 1
    end

  end

end
