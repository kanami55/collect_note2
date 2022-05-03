require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @plan = FactoryBot.build(:plan)
  end

  describe 'スケジュール新規登録' do
    context '新規登録に成功したとき' do
      it "内容に問題がない場合" do
        expect(@plan).to be_valid # 有効であるか
      end
    end

    context '新規登録に失敗したとき' do
      it 'titleが空では登録出来ない' do
        @plan.title = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Titleを入力してください")
      end
      it 'start_timeが空では登録出来ない' do
        @plan.start_time = ''
        @plan.valid?
        expect(@plan.errors.full_messages).to include("Start timeを入力してください")
      end
    end
  end
end