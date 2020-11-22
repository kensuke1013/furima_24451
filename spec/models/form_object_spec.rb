require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    user = FactoryBot.create(:user)
    @form_object = FactoryBot.build(:form_object, user_id: user.id)
  end

  context '保存できる場合' do
    it "全てあれば保存できる" do
      expect(@form_object).to be_valid
    end

    it "建物が空でも保存できること" do
      @form_object.building_name = nil
      @form_object.valid?
      expect(@form_object.errors[:building_name]).to include()
    end

    
  end

  context '保存できない場合' do

    it "配送先の情報として、郵便番号が必須であること" do
      @form_object.post_code = nil
      @form_object.valid?
      expect(@form_object.errors[:post_code]).to include("can't be blank")
    end

    it "配送先の情報として、都道府県が必須であること" do
      @form_object.shipmentsource_id = nil
      @form_object.valid?
      expect(@form_object.errors[:shipmentsource_id]).to include("can't be blank")
    end

    it "都道府県が「--」の場合、保存できないこと" do
      @form_object.shipmentsource_id = 1
      @form_object.valid?
      expect(@form_object.errors[:shipmentsource_id]).to include("can't be blank")
    end

    it "配送先の情報として、市区町村が必須であること" do
      @form_object.city = nil
      @form_object.valid?
      expect(@form_object.errors[:city]).to include("can't be blank")
    end

    it "配送先の情報として、番地が必須であること" do
      @form_object.house_number = nil
      @form_object.valid?
      expect(@form_object.errors[:house_number]).to include("can't be blank")
    end

    it "配送先の情報として、電話番号が必須であること" do
      @form_object.phone_number = nil
      @form_object.valid?
      expect(@form_object.errors[:phone_number]).to include("is invalid")
    end

    it "郵便番号にはハイフンが必要であること（123-4567となる）" do
      @form_object.post_code = 1234567
      @form_object.valid?
      expect(@form_object.errors[:post_code]).to include("is invalid. Include hyphen(-)")
    end

    it "電話番号にはハイフンは不要で、11桁以内であること" do
      @form_object.phone_number = 1223456789000
      @form_object.valid?
      expect(@form_object.errors[:phone_number]).to include("is out of setting range")
    end

    it "tokenが必須であること" do
      @form_object.token = nil
      @form_object.valid?
      expect(@form_object.errors[:token]).to include("can't be blank")
    end

  end


end