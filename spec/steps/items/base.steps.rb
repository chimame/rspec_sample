# encoding: utf-8

steps_for :item do
  # 検証ステップ
  # 操作ステップ
  step "Item一覧画面を表示する" do
    visit "items"
  end
end
