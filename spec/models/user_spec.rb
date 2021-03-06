require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録に成功したとき' do
      it "内容に問題がない場合" do
        expect(@user).to be_valid # 有効であるか
      end
    end

    context '新規登録が失敗したとき' do
      it "nameが空では登録出来ない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nameを入力してください")
      end
      it "emailが空では登録出来ない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it "emailが重複していたら登録出来ない" do
        @user.save
        another_email = FactoryBot.build(:user)
        another_email.email = @user.email
        another_email.valid?
        expect(another_email.errors.full_messages).to include("Emailはすでに存在します")
      end
      it "passwordが空では登録出来ない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it "password_confirmationが空では登録出来ない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
    end
  end
end
