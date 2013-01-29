namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(vorname: "Sebastian",
                 nachname: "Kovar",
                 email: "sebastian.kovar@gmail.com",
                 password: "passwort",
                 password_confirmation: "passwort")
    99.times do |n|
      vorname  = Faker::Name.name
      nachname  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "passwort"
      User.create!(vorname: vorname,
                   nachname: nachname,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end