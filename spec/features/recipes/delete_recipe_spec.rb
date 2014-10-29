# Feature: Delete
#   As a user
#   I want to delete a recipe
feature 'Delete recipe'  do

# Scenario: User cannot delete a recipe if not is the owner
#   Given I do not exist as a user
#   When I try to delete a existing recipe
#   Then I see "You need to sign in or sign up before continuing" message.
	scenario 'User cannot view create recipe form if not registered' do
		visit new_recipe_path
		expect(page).to have_content "You need to sign in or sign up before continuing."
	end

# Scenario: User can delete a recipe  if autenticated
#   Given I'm the owner of the recipe
#   When I try to delete the recipe
#   Then I see "recipe succesfully deleted" message.
	scenario 'User can view create recipe form if autenticated' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		visit new_recipe_path
		expect(page).to have_content "New recipe"
	end	
end