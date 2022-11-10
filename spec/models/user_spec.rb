require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do 
    context '新規登録できるとき' do
      it "ニックネームとメールアドレス、パスワードとパスワード(確認)、お名前とお名前カナが存在すれば登録できる" do 
        expect(@user).to be_valid
      end
      it "パスワードが6文字以上の半角英数字混合であれば登録できる" do 
        @user.password = "1a1a1a"
        @user.password_confirmation = "1a1a1a"
        expect(@user).to be_valid
      end
      it "名字が全角文字であれば登録できる" do
        @user.last_name = "星野"
        expect(@user).to be_valid 
      end
      it "名前が全角文字であれば登録できる" do
        @user.first_name = "優太"
        expect(@user).to be_valid 
      end
      it "名字が全角カナであれば登録できる" do
        @user.last_name = "ホシノ"
        expect(@user).to be_valid 
      end
      it "名前が全角カナであれば登録できる" do
        @user.first_name = "ユウタ"
        expect(@user).to be_valid 
      end
    end  
    context '新規登録できないとき' do
      it "ニックネームが必須であること" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "メースアドレスが必須であること" do 
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスが一意性であること" do 
        @user.save 
        another_user = FactoryBot.build(:user) 
        another_user.email = @user.email 
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは、＠を含む必要だあること" do 
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "パスワードが必須であること" do 
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end
      it "パスワードは、6文字以上での入力が必須であること" do  
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードとパスワード(確認)は、値の一致が必須であること" do  
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "生年月日が必須であること" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end
end
