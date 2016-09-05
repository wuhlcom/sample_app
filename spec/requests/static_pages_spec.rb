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
 shared_examples_for "all static pages" do
   it { should have_content(heading) }
   it { should have_title(full_title(page_title))}
 end 
 
 describe "Home page" do
  before {visit root_path}
  let(:heading){'Sample App'}
  let(:page_title){""}
  it_should_behave_like "all static pages"
  it {should_not have_title('| Home')}
 
  describe "for signed-in users" do
	let(:user){FactoryGirl.create(:user)}
	before do
		FactoryGirl.create(:micropost,user:user,content:"Lorem ipsum")
		FactoryGirl.create(:micropost,user:user,content:"Dolor sit amet")
		sign_in user
		visit root_path
	end

	it "should render the user's feed" do
		user.feed.each do |item|
			expect(page).to have_selector("li##(item.id}",text:item.content)
		end
	end
  end  
 end

 describe "Help page" do
  before {visit help_path}
  let(:heading){'Help'}
  let(:page_title){"Help"}
  it_should_behave_like "all static pages"
 end
 
 describe "About page" do
  before {visit about_path}
  let(:heading){'About Us'}
  let(:page_title){"About"}
  it_should_behave_like "all static pages"
 end

 describe "Contact page" do
  before {visit contact_path}  
  let(:heading){'Contact Us'}
  let(:page_title){"Contact"}
  it {should have_selector("h1",text:'Contact')}
  it_should_behave_like "all static pages"
 end

 it "should have the right links on the layout" do
   visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About'))
   # click_link "Help"
   # expect(page).to # fill in
    click_link "Contact"
    #expect(page).to # fill in
    #click_link "Home"
    #click_link "Sign up now!"
    #expect(page).to # fill in
    #click_link "sample app"
    #expect(page).to # fill in
  end
end
