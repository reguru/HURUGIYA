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
    {name: 'JUNGLE', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), introduction: '大人気の古着屋です。休日にはたくさんのお客さんが店に入っていきます。', user_id: users[0].id, address: '愛知県名古屋市中区大須89-35' },
    {name: 'バイキング', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), introduction: '東京都にある古着屋です。少しわかりにくいところにありますが、様々な古着がおいてあり、定員さんもとても話しやすい方です。', user_id: users[1].id, address: '東京都大東区来門56-1' },
    {name: 'Underwood', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), introduction: 'ヨーロッパ古着好きな方にオススメ！とても多くのヨーロッパ古着が置いてあります！ぜひ行ってみてください！', user_id: users[2].id, address: '神奈川県鎌倉市空座町99-5' }
  ]
)