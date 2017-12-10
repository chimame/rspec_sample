# encoding: utf-8
# language: ja

機能: Item画面
  Item画面の表示・変更を行う

  @item
  シナリオアウトライン: 登録および変更の動作を確認する
    * Item一覧画面を表示する
    * "New Item" リンクをクリックする
    * "Name" に "input name" を設定する
    * "Description" に "input description" を設定する
    * "Create Item" ボタンをクリックする
    * "Name: input name" と表示されていること
    * "Back" リンクをクリックする
    * <num> 番目の "Show" リンクをクリックする
    * "Edit" リンクをクリックする
    * "Name" に "input name2" を設定する
    * "Description" に "input description2" を設定する
    * "Update Item" ボタンをクリックする
    * "Name: input name2" と表示されていること

  サンプル: ただ3回繰り返すだけ
    | num |
    | 1   |
    | 2   |
    | 3   |
