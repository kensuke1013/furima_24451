FactoryBot.define do

  factory :item do
    name                    {"ねこ"}
    introduction            {"ねこ"}
    genre_id                {2}
    itemstatus_id           {2}
    deliveryfee_id          {2}
    shipmentsource_id       {2}
    daystoship_id           {2}
    item_price_id           {1000}
    association :user
  end
end