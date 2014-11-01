feature 'Edit recipe'  do

	scenario 'User cannot view edit recipe form if not registered' do
		recipe = FactoryGirl.create(:recipe)
		visit edit_recipe_path(recipe)
		expect(page).to have_content "You need to sign in or sign up before continuing."
	end

	scenario 'User can view edit recipe form if autenticated' do
		user = FactoryGirl.create(:user)
		signin(user.email, user.password)
		recipe = FactoryGirl.create(:recipe, user_id: user.id)

		visit edit_recipe_path(recipe)
		expect(page).to have_content "Editing recipe"
	end	

	scenario 'User can edit a recipe if autenticated' do
		user = FactoryGirl.create(:user)
		recipe = FactoryGirl.create(:recipe, name: "name1", user_id: user.id)
		signin(user.email, user.password)
		
		visit edit_recipe_path(recipe)
		fill_in('recipe_name', :with => 'name2')
		click_button 'Update Recipe'

		expect(page).to have_content "Receta actualizada con exito"
		visit recipe_path(recipe)
		expect(page).to have_content "name2"
	end	
end
