json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :user_id, :category, :cuisine, :dish_type, :gluten_free, :vegetarian, :high_prot, :vegan, :price, :difficult, :time, :name, :short_desc, :desc, :ingredients, :likes, :author, :date_pub
  json.url recipe_url(recipe, format: :json)
end
