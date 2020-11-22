require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.item_img = fixture_file_upload("8032809789307.jpg")
  end

  describe '#create' do

    context '出品できる場合' do
      it "全てあれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it "画像は1枚必須であること(ActiveStorageを使用すること)" do
        @item.item_img = nil
        @item.valid?
        expect(@item.errors[:item_img]).to include("can't be blank")
      end

    
      it "商品名が必須であること" do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end



    
      it "商品の説明が必須であること" do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors[:introduction]).to include("can't be blank")
      end



    
      it "カテゴリーの情報が１以外で登録できる" do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors[:genre_id]).to include("must be greater than or equal to 2")
      end




  
      it "商品の状態について１以外で登録できる" do
        @item.itemstatus_id = 1
        @item.valid?
        expect(@item.errors[:itemstatus_id]).to include("must be greater than or equal to 2")
      end




    
      it "配送料の負担について１以外で登録できる" do
        @item.deliveryfee_id = 1
        @item.valid?
        expect(@item.errors[:deliveryfee_id]).to include("must be greater than or equal to 2")
      end



    
      it "発送元の地域について１以外で登録できる" do
        @item.shipmentsource_id = 1
        @item.valid?
        expect(@item.errors[:shipmentsource_id]).to include("must be greater than or equal to 2")
      end



    
      it "発送日数について１以外で登録できる" do
        @item.daystoship_id = 1
        @item.valid?
        expect(@item.errors[:daystoship_id]).to include("must be greater than or equal to 2")
      end


    
      it "価格についての情報が必須であること" do
        @item.item_price_id = nil
        @item.valid?
        expect(@item.errors[:item_price_id]).to include("is not a number")
      end



    
      it "価格が299円以下だと登録できないこと" do
        @item .item_price = 299
        @item.valid?
        expect(@item.errors[:item_price_id]).to include("must be greater than or equal to 300")
      end


    
      it "価格が9,999,999円より高い場合登録できないこと" do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors[:item_price_id]).to include("must be less than or equal to 999999")
      end

    end   
  end
end






