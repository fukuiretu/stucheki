# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

11.times do |time|
  Event.create(
    origin_type: 1,
    title: "hoge_title #{time}",
    description: "hoge_description #{time}",
    tag: 'ruby,rails,aws',
    from_date: Time.now,
    to_date: Time.now,
    place: '神奈川県横浜市戸塚区',
    link: 'http://example.com'
  )
end
