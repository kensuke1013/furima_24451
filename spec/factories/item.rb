FactoryBot.define do

  factory :item do
    name            {"名前"}
    introduction            {"説明"}
    genre_id          {1}
    itemstatus_id          {2}
    deliveryfee_id           {2}
    shipmentsource_id            {2}
    daystoship_id          {2}
    item_price_id     {200}
  end
end