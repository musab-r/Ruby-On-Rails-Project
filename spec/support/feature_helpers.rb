module FeatureHelpers
  def self.sign_in
    @user = FactoryGirl.create(:user)

   		visit new_user_session_url
		fill_in "Email", :with => "test@test2.com"
		fill_in "Password", :with => "testtest"
		check 'Remember me'
		click_button "Log in"
		expect(page).to have_text "Welcome to Rails"
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, :type => :feature
end