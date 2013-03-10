require 'spec_helper'

describe User do

	before {@user = User.new(username: "Example User", email: "user@example.com", fixlinephone: "2341", 
													 mobilephone: "12343221345", password: "llllll", password_confirmation: "llllll")}

	subject {@user}

	it {should respond_to(:username)}
	it {should respond_to(:email)}
	it {should respond_to(:fixlinephone)}
	it {should respond_to(:mobilephone)}
	it {should respond_to(:password_digest)}
	it {should respond_to(:password)}
	it {should respond_to(:password_confirmation)}
	it {should respond_to(:authenticate)}

	it {should be_valid}

	describe "when username is not present" do 
		before {@user.username = ""}

		it {should_not be_valid}
	end

	describe "when email is not present" do 
		before {@user.email = ""}

		it {should_not be_valid}
	end

	describe "when mobilephone is not present" do
		before {@user.mobilephone = ""}

		it {should_not be_valid}
	end

	describe "when username is too short" do 
		before {@user.username = "ab"}

		it {should_not be_valid}
	end

	describe "when username is too long" do 
		before {@user.username = "a" % 51}

		it {should_not be_valid}
	end

	describe "when mobilephone.size is not 11" do 
		before {@user.mobilephone = "1" * 10}

		it {should_not be_valid}
	end

	describe "when mobilephone is not numbers" do 
		before {@user.mobilephone = "a" * 11}

		it {should_not be_valid}
	end

	describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not presence" do 
  	before {@user.password = @user.password_confirmation = ""}
  	it {should_not be_valid }
  end

  describe "when password doesn't match password_confirmation" do 
  	before {@user.password_confirmation = "mismatch"}
  	it {should_not be_valid}
  end

  describe "when password_confirmation is nil" do 
  	before {@user.password_confirmation = nil}
  	it {should_not be_valid}
  end

  describe "when the password is too short" do 
  	before {@user.password = @user.password_confirmation = "a" * 5}
  	it {should_not be_valid}
  end

  describe "return value of authenticate method" do 
  	before {@user.save}
  	let(:found_user) {User.find_by_email(@user.email)}

  	describe "with valid password" do 
  		it {should == found_user.authenticate(@user.password)}
  	end

  	describe "with invalid password" do 
  		let(:user_for_invalid_password) {found_user.authenticate("invalid")}

  		it {should_not == user_for_invalid_password}
  		specify {user_for_invalid_password.should be_false }
  	end
  end
end