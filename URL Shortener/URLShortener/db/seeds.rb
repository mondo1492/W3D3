# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(:email => "CJ@gmail.com")
  user2 = User.create(:email => "Flarnie@gmail.com")
  user3 = User.create(:email => "Jeff@gmail.com")
  user4 = User.create(:email => "GeorgesSt.Pierre@gmail.com")
  user5 = User.create(:email => "Ned@gmail.com")

  ShortenedUrl.destroy_all
  short1 = ShortenedUrl.create_instance(user1, "al;skdnvisdnva")
  short2 = ShortenedUrl.create_instance(user1, "al;skdnvaopjodsvaadfsdfasdfasoisdnva")
  short3 = ShortenedUrl.create_instance(user2, "al;skdnvadsvaoisdnva")
  short4 = ShortenedUrl.create_instance(user3, "al;skdnvaopjovinaodspvaodnva")
  short5 = ShortenedUrl.create_instance(user5, "al;;skdnvaopjovinaodspvaois;skvaopjovinaodspvaois;skdnvaopjovinaodspvaois;skdnvaopjovinaodspvaoissknva")

  Visit.destroy_all
  Visit.record_visit!(user1, short1)
  Visit.record_visit!(user1, short2.short_url)
  Visit.record_visit!(user1, short3.short_url)
  Visit.record_visit!(user1, short4.short_url)
  Visit.record_visit!(user1, short5.short_url)
  Visit.record_visit!(user2, short1.short_url)
  Visit.record_visit!(user2, short2.short_url)
  Visit.record_visit!(user3, short3.short_url)
  Visit.record_visit!(user4, short4.short_url)
  Visit.record_visit!(user5, short5.short_url)
  Visit.record_visit!(user5, short3.short_url)
  Visit.record_visit!(user5, short1.short_url)
end
