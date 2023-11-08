# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by!(email: "admin@example.jp") do |admin|
  admin.password = "Admin6789"
end

tag = [
  #系統
  {name: 'ストリート系'},
  {name: 'アメカジ系'},
  {name: 'ミリタリー系'},
  {name: 'ヨーロッパ古着系'},
  {name: 'きれいめカジュアル系'},
  {name: 'ワーク系'},
]

tag.each do |tag|
  Tag.find_or_create_by!(tag)
end

shopTag = [
  # 店の雰囲気
  {name: '落ち着いている'},
  {name: '人が多い'},
  {name: '楽しい'},
  {name: '明るい'},
  {name: '暗い'},
]

shopTag.each do |shopTag|
  ShopTag.find_or_create_by!(shopTag)
end

olivia = User.find_or_create_by!(email: "olivia@test.com") do |user|
  user.name = "Olivia"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

james = User.find_or_create_by!(email: "james@test.com") do |user|
  user.name = "James"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

lucas = User.find_or_create_by!(email: "lucas@test.com") do |user|
  user.name = "Lucas"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end


post1 = Post.find_or_create_by!(name: "JUNGLE") do |post|
  post.introduction = "大人気の古着屋です。休日にはたくさんのお客さんが店に入っていきます。"
  post.user = olivia
  post.address = "愛知県名古屋市中村区名駅1丁目1-4"
  post.latitude = "-3.7037"
  post.longitude = "40.4167"
end

post2 = Post.find_or_create_by!(name: "バイキング") do |post|
  post.introduction = "東京都にある古着屋です。少しわかりにくいところにありますが、様々な古着がおいてあり、定員さんもとても話しやすい方です。"
  post.user = james
  post.address = "東京都千代田区丸の内1丁目"
  post.latitude = "153.9807"
  post.longitude = "24.2867"
end

post3 = Post.find_or_create_by!(name: "Underwood") do |post|
  post.introduction = "ヨーロッパ古着好きな方にオススメ！とても多くのヨーロッパ古着が置いてあります！ぜひ行ってみてください！ 店内もとても雰囲気がよく、店員さんも良い人なのでとても居心地がいいです。 行ったら毎回いいものが置いてあり、毎回買ってしまいます。それほどいいです！"
  post.user = lucas
  post.address = "神奈川県横浜市西区高島2丁目"
  post.latitude = "-74.0059"
  post.longitude = "40.7127"
end

post1.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
post2.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
post3.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")