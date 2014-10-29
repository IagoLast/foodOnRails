# Feature: crud
#   As a user
#   I want to create, read, update, & recipes delete 
feature 'Create recipe'  do

# Scenario: User cannot view create recipe form if not registered
#   Given I do not exist as a user
#   When I try to create a new recipe
#   Then I see "You need to sign in or sign up before continuing" message.
	scenario 'User cannot view create recipe form if not registered' do
		visit new_recipe_path
		expect(page).to have_content "You need to sign in or sign up before continuing."
	end

# Scenario: User can view create recipe if autenticated
#   Given I do not exist as a user
#   When I try to create a new recipe
#   Then I see the new recipe form.
	scenario 'User can view create recipe form if autenticated' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		visit new_recipe_path
		expect(page).to have_content "New recipe"
	end	

# Scenario: User can create a recipe if autenticated
#   Given I do exist as a user
#   When I try to create a new recipe
#   Then I see "Receta creada con éxito" message.
	scenario 'User can create a new recipe if autenticated' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		visit new_recipe_path
		attach_file('recipe_avatar', Rails.root + 'spec/fixtures/files/salad.jpg')
		click_button 'Create Recipe'
		expect(page).to have_content "Receta creada con exito"
	end	

# Scenario: User cannot create a recipe with no image
#   Given I do not exist as a user
#   When I try to create a new recipe
#   Then I see "avatar needed" message.
	scenario 'User can create a new recipe if autenticated' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		visit new_recipe_path
		click_button 'Create Recipe'
		expect(page).to have_content "Avatar can't be blank"
	end	
end