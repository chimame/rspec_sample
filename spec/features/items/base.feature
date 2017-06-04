# encoding: utf-8
# language: ja

機能: Item画面
  Item画面の表示・変更を行う

  @item
  シナリオ: 登録および変更の動作を確認する
    * Item一覧画面を表示する
    * "New Item" リンクをクリックする
    * "Name" に "input name" を設定する
    * "Description" に "input description" を設定する
    * "Create Item" ボタンをクリックする
    * "Name: input name" と表示されていること
