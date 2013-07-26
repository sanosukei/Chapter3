require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
  before {visit root_path}
    it "should have the right title" do
      page.should have_selector('title',
       :text => "Sample App")
    end
    
	it "should have the h1 'Welcome to the Sample App'" do
		page.should have_selector('h1',
				:text => 'Welcome to the Sample App')
	end
	
	it "should have the right title" do
      page.should_not have_selector('title',
       :text => "Ruby on Rails Tutorial Sample App | Home")
    end
	
  end
  
  
  
  describe "Help Page" do
  before {visit help_path}
   	it "should have the h1 'Help'" do
		page.should have_selector('h1',
					:text => 'Help')
	end

	it "should have the right title" do
      	page.should have_selector('title',
       				:text => "Ruby on Rails Tutorial Sample App | Help")
   	end
  end
  
  
  describe "About us" do
  before {visit about_path}
   	it "should have the h1 'About Us'" do
		page.should have_selector('h1',
					:text => 'About Us')
	end

	it "should have the right title" do
    		page.should have_selector('title',
       				:text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end
  
  
  describe "Contact page" do
  before {visit contact_path}
   	it "should have the content 'Contact'" do
		page.should have_content('Contact')
	end

	it "should have the title 'Contact'" do
    		page.should have_selector('title',
       :text => "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
  
end
