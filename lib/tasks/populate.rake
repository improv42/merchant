namespace :db do

  desc "Clear the DB and fill with excellent sample data."

  task :populate => :environment do

    # Give it access to both populator and faker
    require 'populator'
    require 'faker'

    # Clear out every record inside these 3 tables
    [Product, Category, Brand].each(&:destroy_all)

    # Creates 5 new Categories
    Category.populate 5 do |category|
      category.name = Faker::Commerce.department(1, true)

      # Creates 2 new Brands per category
      Brand.populate 2 do |brand|
        brand.name = Faker::Company.name

        # Creates 5-10 Products
        Product.populate 5..10 do |product|
          product.name = Faker::Commerce.product_name
          product.current_price = Faker::Commerce.price
          product.quantity = rand(1..100)
          product.description = Faker::Lorem.paragraph
          product.brand_id = rand(1..10)
          product.category_id = rand(1..5)
        end
      end
    end
    puts "Heck YEAH!  Check that stuff out!"
  end
end
