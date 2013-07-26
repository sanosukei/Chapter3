require 'spec_helper'

describe "User Pages" do
	subject { page }

	describe "signup page" do
    	before { visit signup_path }
    
    	it { should have_content('Sign up') }
    	it { should have_selector('title', 
    				:text => "Ruby on Rails Tutorial Sample App | Sign up") }
  end
	
	
  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
	before { visit user_path(user) }
	
	it { should have_content(user.name) }
	it { should have_selector('title', :text => user.name) }
  end
	
  
  describe "signup" do
  
  	before { visit signup_path }
  	
  	let(:submit) { "Create my account" }
  	
  	describe "With invalid information" do
  		it "should not create a user" do
  			expect { click_button submit }.not_to change(User, :count)
  		end
  	end
  	
  	describe "with valid information" do
  		before do
  			fill_in "Name",		with: "Example"
  			fill_in "Email",		with: "user@example.com"
  			fill_in "Password",		with: "testin"
  			fill_in "Confirmation",	with: "testin"
  		end
  		
  		it "should create a user" do
  			expect { click_button submit }.to change(User, :count).by(1)
  		end
  	end
  end
end

