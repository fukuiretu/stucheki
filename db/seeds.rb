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

# 11.times do |time|
#   ChekiEvent.create(
#     user_id: 1,
#     event_id: time + 1,
#     cheki_status: 1
#   )
# end

%w(Ruby Rails Java AWS Docker GCE Fluentd PHP Redis Chef MySQL PostgreSQL Go Perl).each do |content|
  Tag.create(
    content: content
  )
end
