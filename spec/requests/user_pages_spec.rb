require 'rails_helper'

RSpec.describe "Users", type: :request do
  subject {page} 

  describe "signup page" do
    before { visit signup_path }
    it {should have_http_status(200)}
    it {should have_content('Sign up')}
    it {should have_title(full_title('Sign up'))}
  end
end
