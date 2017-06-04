# encoding: utf-8
# page オブジェクトに関するステップ

# 検証用ステップ
#表示用
step %(:text と表示されていること) do |text|
  expect(page).to have_content(text)
end

step %(:text と表示されていないこと) do |text|
  expect(page).not_to have_content(text)
end

step %(:element エレメントに :text と表示されていること) do |element, text|
  expect(element).to have_content(text)
end

step %(:element エレメントに :text と表示されていないこと) do |element, text|
  expect(element).not_to have_content(text)
end

step %(:element エレメントに何も表示されていないこと) do |element|
  expect(element.text).to be_blank
end

step %(:id に :text と表示されていること) do |id, text|
  expect(find(id)).to have_content(text)
end

step %(:id に :text と表示されていないこと) do |id, text|
  expect(find(id)).not_to have_content(text)
end

step %(:id に何も表示されていないこと) do |id|
  expect(find(id).text).to be_blank
end

step %(:text が :cnt 個表示されていること) do |text, cnt|
  expect(page).to have_content(text, count: cnt)
end

step %(:button のボタンが表示されていること) do |button|
  expect(page).to have_button(button)
end

step %(:button のボタンが表示されていないこと) do |button|
  expect(page).not_to have_button(button)
end

step %(:link のリンクが表示されていること) do |link|
  expect(page).to have_link(link)
end

step %(:link のリンクが表示されていないこと) do |link|
  expect(page).to have_no_link(link)
end

step %(:id リンクのhrefが相対 :url となっていること) do |id, url|
  link = find(id)
  expect("/#{link[:href].gsub(Capybara.app_host, '')}").to eq url
end

step %(:id リンクのhrefが絶対 :url となっていること) do |id, url|
  link = find(id)
  expect(link[:href]).to eq url
end

step %(:link のリンクが表示されていないこと) do |link|
  expect(page).not_to have_link(link)
end

#テキストボックス用
step %(:id が :value と入力されていること) do |id, value|
  expect(page).to have_field id, with: value
end

step %(:id が :value と入力されていないこと) do |id, value|
  expect(page).not_to have_field id, with: value
end
step %(:id に何も入力されていないこと) do |id|
  expect(find(id).text).to be_blank
end

#ラジオボタンおよびチェックボックス用
step %(:value と選択されていること) do |value|
  expect(page).to have_checked_field(value)
end

step %(:value と選択されていないこと) do |value|
  expect(page).not_to have_checked_field(value)
end

step %(:id が :value と選択されていること) do |id, value|
  within id do
    expect(page).to have_checked_field(value)
  end
end

step %(:id が :value と選択されていないこと) do |id, value|
  within id do
    expect(page).not_to have_checked_field(value)
  end
end

#セレクトボックス用
step %(:id オプションが :value と選択されていること) do |id, value|
  expect(page).to have_select(id, selected: value)
end

step %(:id オプションが :value と選択されていないこと) do |id, value|
  expect(page).not_to have_select(id, selected: value)
end

#画像用
step %(:filename 画像が表示されていること) do |filename|
  expect(page).to have_xpath("//img[contains(@src, \"#{filename}\")]")
end

step %(:filename 画像が表示されていないこと) do |filename|
  expect(page).not_to have_xpath("//img[contains(@src, \"#{filename}\")]")
end

step %(:id セクションが非表示となっていること) do |id|
  expect(find(id, visible: false)).to_not be_visible
end

step %(:id セクションが表示となっていること) do |id|
  expect(find(id)).to be_visible
end

step %(:id セクションが存在しないこと) do |id|
  expect(page).to_not have_css id
end

step %(CSVファイルが出力されること) do
  expect(page.response_headers['Content-Type']).to eq 'text/csv'
  expect(CSV.parse(page.body)).to be_a(Array)
end

step %(ファイル :filename がダウンロードされること) do |filename|
  expect(page.response_headers['Content-Disposition']).to include(%(filename="#{filename}"))
end

step %(セレクトボックス :selectbox に :item があること) do |selectbox, item|
  expect(page).to have_select(selectbox, with_options: item)
end

# 操作用ステップ
step %(:text リンクをクリックする) do |text|
  click_link text
end

step %(:n 番目の :text リンクをクリックする) do |n, text|
  n = n.to_i - 1
  all(:link_or_button, text)[n].click
end

step %(:text ボタンをクリックする) do |text|
  click_button text
end

#buttonやlink以外にクリックする場合に使用する
step %(:id セクションをクリックする) do |id|
  find(id).click
end

step %(:n 番目の :text ボタンをクリックする) do |n, text|
  n = n.to_i - 1
  all(:link_or_button, text)[n].click
end

step %(:field に :value を設定する) do |field, value|
  fill_in field, with: value
end

step %(:n 番目の :field に :value を設定する) do |n, field, value|
  fill_in field, with: value
end

step %(:option オプションの :value を選択する) do |option, value|
  select value, from: option
end

step %(:choice を選択する) do |choice|
  choose choice
end

step %(:id の :choice を選択する) do |id, choice|
  within id do
    choose choice
  end
end

step %(:choice をチェックする) do |choice|
  check choice
end

step %(:choice のチェックを外す) do |choice|
  uncheck choice
end

step %(:id の :choice をチェックする) do |id, choice|
  within id do
    check choice
  end
end

step %(:id の :choice のチェックを外す) do |id, choice|
  within id do
    uncheck choice
  end
end

step "新たに開いたウィンドウを選択する" do
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
end

step "新たなウィンドウを開く" do
  page.driver.open_new_window
end

step "1つ前のウィンドウを選択する" do
  current_handle_index = page.driver.browser.window_handles.find_index(page.driver.current_window_handle)
  return if current_handle_index == 0
  page.driver.browser.switch_to.window(page.driver.browser.window_handles[current_handle_index-1])
end

step "現在のウィンドウを閉じる" do
  page.driver.browser.close
  page.driver.browser.switch_to.window(page.driver.browser.window_handles[0])
end

step "ウィンドウサイズを :width x :height に変更する" do |width, height|
  page.driver.resize_window_to(page.driver.browser.window_handles[0], width, height)
end

step "JSダイアログのはいをクリックする" do
  page.driver.browser.switch_to.alert.accept
end

step "JSダイアログのいいえをクリックする" do
  page.driver.browser.switch_to.alert.dismiss
end

step %(Ajax処理を待つ) do
  sleep 1.0
end

step %(何もしない) do
  #ほんとに何もしない
end

step "時間を :datetime にする" do |datetime|
  set_time = Time.zone.parse(datetime)
  travel_to(set_time)
end

# デバッグ用
step %(pryを呼び出す) do
  binding.pry
  puts ''
end

step %(表示する) do
  save_and_open_page
end
