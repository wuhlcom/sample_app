require 'rails_helper'
#require 'spec_helper'

RSpec.describe "StaticPages", type: :request do
 # describe "GET /static_pages" do
 #  it "works! (now write some real specs)" do
 #visit root_path
 #   expect(response).to have_http_status(200)
 # end
 # end
  
 subject {page} 
 describe "Home page" do
   before {visit root_path}
   it {should have_content('Sample App')}
   it {should have_title(full_title(""))}
   it {should_not have_title('| Home')}
 end

 describe "Help page" do
   before {visit help_path}
   it {should have_content('Help')}
   it {should have_title(full_title("Help"))}
 end
 
 describe "About page" do
   before {visit about_path}
   it {should have_content('About Us')}
   it {should have_title(full_title("About"))}
 end

 describe "Contact page" do
   before {visit contact_path}  
   it {should have_content('Contact')}
   it {should have_title(full_title("Contact"))}
 end

end
