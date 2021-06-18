require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録/ユーザー情報' do
    context 'ユーザー新規登録できる場合' do
      it '正しく情報を入力できている時は、ユーザー新規登録できること' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録できない場合' do
      it 'ニックネームが必須であること(空では登録できない)' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること(空では登録できない)' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること(重複したemailは登録できない)' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること(空では登録できない)' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること(5文字以下では登録できない)' do
        @user.password = 'a2345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、数字のみでは登録できない事' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
      it 'パスワードは、英語のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
      it 'パスワードは、全角文字では登録できないこと' do
        @user.password = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers.')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end

  describe 'ユーザー新規登録/本人情報確認' do
    context '本人情報確認が不十分では、ユーザー新規登録できない場合' do
      it 'お名前(全角)は、名字と名前がそれぞれ必須であること(名前)' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)は、名字と名前がそれぞれ必須であること(名字)' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名前)' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名字)' do
        @user.last_name = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること(名前)' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること(名字)' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること(ひらがなでは登録できない)' do
        @user.kana_first_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid. Input full-width katakana characters.')
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること(英字では登録できない)' do
        @user.kana_first_name = 'ｔａｒｏｕ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid. Input full-width katakana characters.')
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること(ひらがなでは登録できない)' do
        @user.kana_last_name = 'ふりま'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid. Input full-width katakana characters.')
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること(英字では登録できない)' do
        @user.kana_last_name = 'ｈｕｒｉｍａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid. Input full-width katakana characters.')
      end
      it '生年月日が必須であること(空では登録できない)' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
