# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create([
  {
    origin_type: 1,
    title: 'hoge_title_1',
    description: 'hoge_description_1',
    tag: 'ruby,rails,aws',
    from_date: Time.now,
    to_date: Time.now
  },
  {
    origin_type: 2,
    title: 'hoge_title_2',
    description: 'hoge_description_2',
    tag: 'ruby,rails,aws',
    from_date: Time.now,
    to_date: Time.now
  }
])
