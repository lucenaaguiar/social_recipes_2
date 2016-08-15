FactoryGirl.define do
  factory :recipe do
    name "Torta"
    cuisine
    food_type "Principal"
    serves 1
    cooking_time 120
    level "Fácil"
    ingredients "Vários"
    directions "Passos"
  end
end
