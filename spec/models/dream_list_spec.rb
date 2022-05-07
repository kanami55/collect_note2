require 'rails_helper'

RSpec.describe DreamList, type: :model do
  before do
    @dream_list = FactoryBot.build(:dream_list)
  end

  describe 'dream_list新規登録' do
    context '新規投稿に成功したとき' do
      it "内容に問題がない場合" do
        expect(@dream_list).to be_valid # 有効であるか
      end
    end

    context '新規登録に失敗したとき' do
      it "dreamが空では登録出来ない" do
        @dream_list.dream = ''
        @dream_list.valid?
        expect(@dream_list.errors.full_messages).to include("Dreamを入力してください")
      end
      it "countdownが空では登録出来ない" do
        @dream_list.period = ''
        @dream_list.valid?
        expect(@dream_list.errors.full_messages).to include("Countdownを入力してください")
      end
      it "categoryが空では登録出来ない" do
        @dream_list.category = ''
        @dream_list.valid?
        expect(@dream_list.errors.full_messages).to include("Categoryを入力してください")
      end
    end
  end
end