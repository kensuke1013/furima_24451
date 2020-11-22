FactoryBot.define do
  factory :form_object do
    post_code           {"123-4567"}
    shipmentsource_id   {2}
    city                {"横浜市"}
    house_number        {"青山"}
    phone_number        {"09012345678"}
    building_name       {}
    token               {}
  end
end
