require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "tests save" do
      @product = Product.new
      @test = Category.new
      @test.name = 'Test'
      @product.name = 'Test' 
      @product.price_cents = 10000
      @product.quantity = 10
      @product.category = @test
      expect(@product.valid?).to be true
    end

    it "Tests when name is nil" do
      @product = Product.new
      @product.name = nil 
      @product.valid?
      expect(@product.errors[:name]).to  include("can't be blank")

      @product.name = 'test' 
      @product.valid? 
      expect(@product.errors[:name]).not_to  include("can't be blank")
    end

    it "Tests when price is nil" do
      @product = Product.new
      @product.price_cents = nil 
      @product.valid?
      expect(@product.errors[:price_cents]).to  include("is not a number")

      @product.price_cents = 10000
      @product.valid? 
      expect(@product.errors[:price_cents]).not_to  include("can't be blank")
    end

    it " Tests when quantity is nil" do
      @product = Product.new
      @product.quantity = nil 
      @product.valid?
      expect(@product.errors[:quantity]).to  include("can't be blank")

      @product.quantity = 10
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("can't be blank")
    end

    it "Tests when category is nil" do
      @test = Category.new
      @product = Product.new
      @product.category = nil 
      @product.valid?
      expect(@product.errors[:category]).to  include("can't be blank")

      @product.category = @test 
      @product.valid? 
      expect(@product.errors[:category]).not_to  include("can't be blank")
    end


  end

  
end