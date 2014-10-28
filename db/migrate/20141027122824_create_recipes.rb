class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true
      t.string :category
      t.string :cuisine
      t.string :dish_type
      t.boolean :gluten_free
      t.boolean :vegetarian
      t.boolean :high_prot
      t.boolean :vegan
      t.decimal :price
      t.decimal :difficult
      t.decimal :time
      t.string :name
      t.string :short_desc
      t.text :desc
      t.text :ingredients
      t.decimal :likes
      t.string :author
      t.datetime :date_pub

      t.timestamps
    end
  end
end
