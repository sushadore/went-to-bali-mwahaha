Product.destroy_all

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_products
  end

  def generate_products
    20.times do |i|
      Product.create!(name: Faker::Lorem.word, price: rand(10...100), description: Faker::Company.bs, image: Faker::LoremPixel.image)
    end
  end
end

Seed.begin
