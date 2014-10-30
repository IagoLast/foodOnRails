# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe do
    user nil
    category "MyString"
    cuisine "MyString"
    dish_type "MyString"
    gluten_free false
    vegetarian false
    high_prot false
    vegan false
    price "9.99"
    difficult "9.99"
    time "9.99"
    name "MyString"
    short_desc "MyString"
    desc "MyText"
    ingredients "MyText"
    avatar File.new(Rails.root + 'spec/fixtures/files/salad.jpg')
    likes "9.99"
    author "MyString"
    date_pub "2014-10-27 13:28:24"
  end
end
