require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー新規登録ができる時' do
      it 'nicknameとemailとpasswordとpassword_confirmationとlastname,firstnameとlastname_reading,firstname_readingとbirthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end
    end

    context 'ユーザーが新規登録できない時' do
      it 'nicknameとemailとpasswordとpassword_confirmationとlastname,firstnameとlastname_reading,firstname_readingとbirthdayが存在しないと登録できないこと' do
        @user = build(:user, nickname: nil, email: nil, password: nil, password_confirmation: nil, lastname: nil,
                             firstname: nil, lastname_reading: nil, firstname_reading: nil, birthday: nil)
        expect(@user).not_to be_valid
      end

      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複していると登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がついていない場合は登録できないこと' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '11aaa'
        @user.password_confirmation = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でない場合は登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角英数字混合では登録できないこと' do
        @user.password = '１１１AAA'
        @user.password_confirmation = '１１１AAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが一致していない場合は登録できないこと' do
        @user.password_confirmation = '1aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'lastnameが空では登録できないこと' do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'firstnameが空では登録できないこと' do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'lastnameが全角でない場合は登録できないこと' do
        @user.lastname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end

      it 'firstnameが全角でない場合は登録できないこと' do
        @user.firstname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end

      it 'lastname_readingが空では登録できないこと' do
        @user.lastname_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname reading can't be blank")
      end

      it 'firstname_readingが空では登録できないこと' do
        @user.firstname_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname reading can't be blank")
      end

      it 'lastname_readingが全角カナでなければ登録できないこと' do
        @user.lastname_reading = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname reading is invalid')
      end

      it 'firstname_readingが全角カナでなければ登録できないこと' do
        @user.firstname_reading = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname reading is invalid')
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
