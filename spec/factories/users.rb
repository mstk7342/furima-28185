FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"1a1a1a"}
    family_name           {"安倍"}
    first_name            {"一郎"}
    family_name_kana      {"アベ"}
    first_name_kana       {"イチロウ"}
    birth_day             {"1990-01-01"}
  end
end