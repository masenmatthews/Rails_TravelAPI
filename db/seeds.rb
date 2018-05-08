# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    Destination.destroy_all
    Review.destroy_all

    20.times do |i|
      destination = Destination.create!(
        country: Faker::Address.country,
        city: Faker::Address.city,
        region: Faker::Address.community
      )
      @destination_id = Destination.last.id
      5.times do |i|
      @title = Faker::Hipster.sentence(3, true)
      @text_body = Faker::TheFreshPrinceOfBelAir.quote
      @rating = Faker::Number.between(1, 5)
      Review.create!(title: @title, rating: @rating, text_body: @text_body, :destination_id => @destination_id)
      end
    end
  end
end

p "Created #{Destination.count} destinations"
p "Created #{Review.count} reviews"
Seed.begin
