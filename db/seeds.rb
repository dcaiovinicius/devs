# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Use FFaker

user = User.create!(
  email:                 'admin@example.com',
  password:              '12345678',
  password_confirmation: '12345678',
  admin:                 true
)

10.times do
  user = User.create!(
    email:                 FFaker::InternetSE.unique.email,
    password:              '12345678',
    password_confirmation: '12345678',
  )

  user.create_developer!(
    available_on: FFaker::Time.between(Date.today, Date.today + 180).to_date,
    hero:         FFaker::Lorem.paragraph,
    website:      FFaker::Internet.http_url,
    github:       "https://github.com/#{FFaker::Internet.user_name}",
    bio:          FFaker::Lorem.paragraphs(2).join("\n\n"),
    twitter:      "https://twitter.com/#{FFaker::Internet.user_name}"
  )
end
