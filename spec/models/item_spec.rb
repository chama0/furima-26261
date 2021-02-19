require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#new' do
    context '商品が保存できる場合' do
      it 'nameとdescriptionとcategory_idとstatus_idとshipfee_idとprefecture_idとestshipdate_idとpriceとimageが存在すれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できない場合' do
      it 'nameが空だと保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと保存できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空だと保存できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが空だと保存できないこと' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'shipfee_idが空だと保存できないこと' do
        @item.shipfee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipfee can't be blank")
      end

      it 'prefecture_idが空だと保存できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'estshipdate_idが空だと保存できないこと' do
        @item.estshipdate_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Estshipdate can't be blank")
      end

      it 'priceが空だと保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'userが紐づいていない場合は保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '価格が300より小さいと保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9999999より大きいと保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が半角数字でない場合は保存できないこと' do
        @item.price = '１Aa千'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'category_idが初期のまま(1)だと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが初期のまま(1)だと保存できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'shipfee_idが初期のまま(1)だと保存できないこと' do
        @item.shipfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipfee must be other than 1')
      end

      it 'prefecture_idが初期のまま(1)だと保存できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'estshipdate_idが初期のまま(1)だと保存できない' do
        @item.estshipdate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Estshipdate must be other than 1')
      end
    end
  end
end
