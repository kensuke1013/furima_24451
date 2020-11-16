FactoryBot.define do

  factory :user do
    nickname                  {"furima太郎"}
    family_name               {"山田"}
    family_name_kana          {"ヤマダ"}
    first_name                {"太郎"}
    first_name_kana           {"タロウ"}
    birth_day                 {"1930-01-01"}
    email                     {"24451@gmail.com"}
    password                  {"Furima24451"}
    password_confirmation     {"Furima24451"}
  end
end