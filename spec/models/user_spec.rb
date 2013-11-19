require 'spec_helper'

describe User do

  def valid_user_params
    {name: "Test User", email: "test@example.com", password: "password"}
  end

  context "validations" do
    it "should require an email" do
      params = valid_user_params
      params.delete(:email)
      @user = User.new(params)
      @user.save.should be_false
      @user.errors[:email].include?("can't be blank").should be_true
    end

    it "should require a valid email address" do
      params = valid_user_params
      params[:email] = "sjdkgh@vfdkv"
      @user = User.new(params)
      @user.save.should be_false
      @user.errors[:email].include?("is invalid").should be_true
    end

    it "should require a unique email address" do
      params = valid_user_params
      @user1 = User.create(params)
      @user2 = User.new(params)
      @user2.save.should be_false
      @user2.errors[:email].include?("has already been taken").should be_true
    end
  end


  context "given a user in the database" do
    before do
      @user = User.create!( valid_user_params )
    end

    context ".authenticate" do

      context "success" do
        it "should return the proper user given good credentials" do
          credentials = valid_user_params.slice( :email, :password )
          User.authenticate( credentials ).should == @user
        end
      end

      context "failure" do
        it "should return nil given bad password" do
          credentials = {password: "badpassword", email: valid_user_params[:email] }
          User.authenticate( credentials ).should be_nil
        end
      end

    end
  end

end
