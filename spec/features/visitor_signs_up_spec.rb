require 'rails_helper'


feature "visitor signs up" do
	scenario "with valid data" do
		visit "/users/sign_up"

		fill_in "Email", :with => "admin@gmail.com"
		fill_in "Username", :with => "admin"
		fill_in "Password", :with => "password1234"
		fill_in "Password confirmation", :with => "password1234"
		
		click_button "Sign up"

		expect(page).to have_text("Welcome")
	end
	# 	# add expectation if we failed out the form
	# scenario "missing an email address" do
	# end

end
feature "visit" do
	scenario "Sign In" do

		create :user
		
		visit new_user_session_url

		fill_in "Email", :with => "test@test2.com"
		fill_in "Password", :with => "testtest"
		check 'Remember me'

		click_button "Log in"

		expect(page).to have_text "Welcome"

	end
end

feature "visit" do
	scenario "edit user" do

		create :user
		visit new_user_session_url

		fill_in "Email", :with => "test@test2.com"
		fill_in "Password", :with => "testtest"
		check 'Remember me'

		click_button "Log in"

		expect(page).to have_text "Welcome"

		visit edit_user_registration_url

		fill_in "Email", :with => "test@gmail.com"
		fill_in "Username", :with => "testedit"
		fill_in "Password", :with => "1234567"
		fill_in "Password confirmation", :with => "1234567"
		fill_in "Current password", :with => ""		
		click_button "Update"

		expect(page).to have_text("Login")

	end
end

feature "visit" do
	scenario "new Article" do
		create :user
		visit new_user_session_url

		fill_in "Email", :with => "test@test2.com"
		fill_in "Password", :with => "testtest"
		check 'Remember me'
		click_button "Log in"
		expect(page).to have_text "Welcome to Rails"


		visit new_article_url
		fill_in "article[title]", :with => "Fruits"
		fill_in "article[text]", :with => "Apple"

		click_button "Create"
		expect(page).to have_text "Article created successfully."

	end
end

feature "visitor" do
	scenario "add comment" do
		create :user
		visit new_user_session_url

		fill_in "Email", :with => "test@test2.com"
		fill_in "Password", :with => "testtest"
		check 'Remember me'
		click_button "Log in"
		expect(page).to have_text "Welcome to Rails"

		
		find_link ("New article")
		#xpect(page).to have_text "New article"


		visit new_article_url
		fill_in "article[title]", :with => "Fruits"
		fill_in "article[text]", :with => "Apple"

		click_button "Create"
		expect(page).to have_text "Article created successfully."

		
		# move to a separate block
		# login
		# create an article
		# go to the article show page
		fill_in "comment[commenter]", :with => "abc"
		fill_in "comment[body]", :with => "good"

		click_button "Create Comment"
		expect(page).to have_text "Information"
		
	end
end

feature "visit" do
scenario "delete comment" do
		create :user
		visit new_user_session_url

		fill_in "Email", :with => "test@test2.com"
		fill_in "Password", :with => "testtest"
		check 'Remember me'
		click_button "Log in"
		expect(page).to have_text "Welcome to Rails"

		
		find_link ("New article")
		#xpect(page).to have_text "New article"


		visit new_article_url
		fill_in "article[title]", :with => "Fruits"
		fill_in "article[text]", :with => "Apple"

		click_button "Create"
		expect(page).to have_text "Article created successfully."

		
		# move to a separate block
		# login
		# create an article
		# go to the article show page
		fill_in "comment[commenter]", :with => "abc"
		fill_in "comment[body]", :with => "good"

		click_button "Create Comment"
		expect(page).to have_text "Information"

		click_link "Destroy Comment"
		expect(page).to have_text "Are you sure?"
		
	end
end


feature "visit" do
	scenario "edit article" do
		create :user
		visit new_user_session_url

		fill_in "Email", :with => "test@test2.com"
		fill_in "Password", :with => "testtest"
		check 'Remember me'
		click_button "Log in"
		expect(page).to have_text "Welcome to Rails"

		
		find_link ("New article")
		#xpect(page).to have_text "New article"


		visit new_article_url
		fill_in "article[title]", :with => "Fruits"
		fill_in "article[text]", :with => "Apple"

		click_button "Create"
		expect(page).to have_text "Article created successfully."

		visit edit_article_url
		# click_button "Edit"
		# expect(page).o have_text "Edit article"

		fill_in "article[title]", :with => "Fruitss"
		fill_in "article[text]", :with => "Apples"

		click_button "Create"
		expect(page).to have_text "Article Updated successfully."

	end

end
