require 'bcrypt'

  class User < ActiveRecord::Base

    validates :name, :password_hash, presence: true
    validates :email, presence: true, format: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, uniqueness: true

    include BCrypt

    def password
      @password ||= password_hash? ? Password.new(password_hash) : nil
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
    end

    def self.authenticate user_params
      user = User.find_by_email( user_params[:email] )
      return nil if user.password != user_params[:password]
      user
    end

  end