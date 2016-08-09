require 'rails_helper'
#require 'spec_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      get 'static_pages/home'
      expect(response).to have_http_status(200)
    end
  end
  
  describe "Home page" do
    it "should have the content 'Sample App'" do
      p static_pages_home_path
	visit static_pages_home_path
      expect(page).to have_content('Sample App')
    end
  
   it "should have the right title 'Home'" do
      visit static_pages_home_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
   end 
 end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit static_pages_help_path
      expect(page).to have_content('Help')
    end
 
    it "should have the right title 'Help'" do
     visit static_pages_help_path
     expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end 
 end
 
 describe "About page" do
    it "should have the content 'About Us'" do
      visit static_pages_about_path
      expect(page).to have_content('About Us')
    end
  
    it "should have the right title 'About'" do
      visit static_pages_about_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
    end 
  end

 describe "Contact page" do
    it "should have the conte1nt 'Contact Us'" do
      visit static_pages_contact_path
      expect(page).to have_content('Contact Us')
    end
  
    it "should have the right title 'Contact'" do
      visit static_pages_contact_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end
 end 
end
