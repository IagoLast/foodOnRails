# Feature: Delete
#   As a user
#   I want to delete a recipe
feature 'Delete recipe'  do

# Scenario: User cannot delete a recipe if not is the owner
#   Given I do not exist as a user
#   When I try to view a existing recipe
#   Then I dont see the delete recipe button..
	scenario 'User cannot view delete recipe button if not owns the recipe' do
		recipe = FactoryGirl.create(:recipe)
		visit recipe_path(recipe.id)
		expect(page).not_to have_content "Delete Recipe"
	end

# Scenario: User can view delete recipe button if autenticated
#   Given I'm the owner of the recipe
#   When I go to the recipe path
#   Then I see Delete Recipe button.
	scenario 'User can view delete recipe buttton if autenticated and is the recipe owner' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		recipe = FactoryGirl.create(:recipe, user_id: user.id)
		visit recipe_path(recipe.id)
		expect(page).to have_content "Delete Recipe"
	end	


# Scenario: User can delete a recipe  if autenticated
#   Given I'm the owner of the recipe
#   When I click the delete recipe button
#   Then I see Delete Recipe button.
	scenario 'User can delete a recipe if autenticated as the recipe owner' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		recipe = FactoryGirl.create(:recipe, user_id: user.id)
		visit recipe_path(recipe.id)
		click_link "Delete Recipe"
		expect(page).to have_content "Receta borrada con exito"

		visit recipe_path(recipe.id)
		expect(page.status_code).to eq(404)
	end	
end