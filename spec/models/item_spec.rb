require 'rails_helper'
RSpec.describe Item, type: :model do

  describe '#create' do

    # 1
    it "画像は1枚必須であること(ActiveStorageを使用すること)" do
      item = FactoryBot.build(:item, item_img: nil)
      item.valid?
      expect(item.errors[:item_img]).to include("can't be blank")
    end



    # 2
    it "商品名が必須であること" do
      item = FactoryBot.build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end



    # 3
    it "商品の説明が必須であること" do
      item = FactoryBot.build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end



    # 4
    it "カテゴリーの情報が必須であること" do
      item = FactoryBot.build(:item, genre_id: nil)
      item.valid?
      expect(item.errors[:genre_id]).to include("can't be blank")
    end




    # 5
    it "商品の状態についての情報が必須であること" do
      item = FactoryBot.build(:item, itemstatus_id: nil)
      item.valid?
      expect(item.errors[:itemstatus_id]).to include("can't be blank")
    end




    # 6
    it "配送料の負担についての情報が必須であること" do
      item = FactoryBot.build(:item, deliveryfee_id: nil)
      item.valid?
      expect(item.errors[:deliveryfee_id]).to include("can't be blank")
    end



    # 7
    it "発送元の地域についての情報が必須であること" do
      item = FactoryBot.build(:item, shipmentsource_id: nil)
      item.valid?
      expect(item.errors[:shipmentsource_id]).to include("can't be blank")
    end



    # 8
    it "発送までの日数についての情報が必須であること" do
      item = FactoryBot.build(:item, daystoship_id: nil)
      item.valid?
      expect(item.errors[:daystoship_id]).to include("can't be blank")
    end


    # 9
    it "価格についての情報が必須であること" do
      item = FactoryBot.build(:item, item_price_id: nil)
      item.valid?
      expect(item.errors[:item_price_id]).to include("is not a number")
    end



    # 10
    it "価格が299円以下だと登録できないこと" do
      item = FactoryBot.build(:item, item_price_id: 299)
      item.valid?
      expect(item.errors[:item_price_id]).to include("must be greater than or equal to 300")
    end


    # 11
    it "価格が9,999,999円より高い場合登録できないこと" do
      item = FactoryBot.build(:item, item_price_id: 10000000)
      item.valid?
      expect(item.errors[:item_price_id]).to include("must be less than or equal to 999999")
    end
  end
end






