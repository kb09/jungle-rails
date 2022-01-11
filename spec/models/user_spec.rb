require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do

    it 'Passwords must match' do
      user = User.new(password: '111222', password_confirmation: '111000022')
      expect(user).to_not be_valid
    end

    it 'Passwords must be present' do
      user = User.new(password: '111222', password_confirmation: '111222')
      expect(user).to be_valid
    end

    it 'Emails must be unique' do
      user = User.create(
        email: "random1@hotmail.com"
      )
      userTest = User.new(email: 'opkjkj@gmail.com')
      expect(userTest).to_not be_valid
    end

    it 'Valid when all info is present' do
      user = User.new(first_name: 'Random', last_name: 'Randommm', password: '111222', password_confirmation: '111222', email: 'random1@hotmail.com')
      expect(user).to be_valid
    end

    it 'password length less than 5 characters is invalid' do
      user = User.new(email: '1111', password: '12')
  
      result = user.save
  
      expect(result).to be(false)
    end
  
    it 'password length must be at-least 5 characters' do
      user = User.new(email: '11111', password: '12345')
  
      result = user.save
  
      expect(result).to be(true)
    end
  end

  describe '.authenticated_with_credentials' do

    it 'should pass with valid credentials' do
      user = User.new(
        first_name: 'Random',
        last_name: 'Randommm',
        email: 'random1@hotmail.com',
        password: '111222',
        password_confirmation: '111222'
      )
      user.save
      user = User.authenticate_with_credentials('random1@hotmail.com', '111222')
      expect(user).to_not be(nil)
    end

    it 'should pass with spaces around the email' do
      user = User.new(
        first_name: 'Random',
        last_name: 'Randommm',
        email: 'random1@hotmail.com',
        password: '111222',
        password_confirmation: '111222'
      )
      user.save
      user = User.authenticate_with_credentials('  random1@hotmail.com  ', '111222')
      expect(user).to_not be(nil)
    end

    it 'should pass with wrong cases in the email' do
      user = User.new(
        first_name: 'Random',
        last_name: 'Randommm',
        email: 'random1@hotmail.com',
        password: '111222',
        password_confirmation: '111222'
      )
      user.save
      user = User.authenticate_with_credentials('RaNdOm1@hOtMaIl.com', '111222')
      expect(user).to_not be(nil)
    end
  end
end