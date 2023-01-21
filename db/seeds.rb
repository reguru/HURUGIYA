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
  {name: 'ストリート系'},
  {name: 'アメカジ系'},
  {name: 'ミリタリー系'},
  {name: 'ヨーロッパ古着系'},
  {name: 'きれいめカジュアル系'},
  {name: 'ワーク系'},
  ])