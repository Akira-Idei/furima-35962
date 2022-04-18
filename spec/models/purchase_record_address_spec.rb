require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていて、tokenがあれば保存できること' do
        expect(@purchase_record_address).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @purchase_record_address.building = ''
        expect(@purchase_record_address).to be_valid
      end
    end


    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_record_address.postal_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @purchase_record_address.postal_code = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが1では保存できないこと' do
        @purchase_record_address.prefecture_id = 1
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end

      it 'street_numberが空だと保存できないこと' do
        @purchase_record_address.street_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Street number can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下だと保存できないこと' do
        @purchase_record_address.phone_number = '123456789'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @purchase_record_address.phone_number = '123456789123'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが半角数値以外が含まれていると保存できないこと' do
        @purchase_record_address.phone_number = '1234５67891'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
