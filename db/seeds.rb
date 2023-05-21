# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  email: 'admin@example.jp',
  password: 'Admin6789'
  )

Tag.create([
  #系統
  {name: 'ストリート系'},
  {name: 'アメカジ系'},
  {name: 'ミリタリー系'},
  {name: 'ヨーロッパ古着系'},
  {name: 'きれいめカジュアル系'},
  {name: 'ワーク系'},
  ])

ShopTag.create([
  # 店の雰囲気
  {name: '落ち着いている'},
  {name: '人が多い'},
  {name: '楽しい'},
  {name: '明るい'},
  {name: '暗い'},
  ])

users = User.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@test.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Post.create!(
  [
    {name: 'JUNGLE', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), introduction: '大人気の古着屋です。休日にはたくさんのお客さんが店に入っていきます。', user_id: users[0].id, address: '愛知県名古屋市中村区名駅1丁目1-4', latitude: '-3.7037', longitude: '40.4167' },
    {name: 'バイキング', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), introduction: '東京都にある古着屋です。少しわかりにくいところにありますが、様々な古着がおいてあり、定員さんもとても話しやすい方です。', user_id: users[1].id, address: '東京都千代田区丸の内1丁目', latitude: '153.9807', longitude: '24.2867' },
    {name: 'Underwood', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), introduction: 'ヨーロッパ古着好きな方にオススメ！とても多くのヨーロッパ古着が置いてあります！ぜひ行ってみてください！ 店内もとても雰囲気がよく、店員さんも良い人なのでとても居心地がいいです。 行ったら毎回いいものが置いてあり、毎回買ってしまいます。それほどいいです！', user_id: users[2].id, address: '神奈川県横浜市西区高島2丁目',latitude: '-74.0059', longitude: '40.7127' }
  ]
)