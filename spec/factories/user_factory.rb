FactoryGirl.define do
  factory :user do
    name "Johnathan"
    email "joweisner@gmail.com"
    password "BestPassword123"
    password_confirmation "BestPassword123"
    factory :admin_user do
      admin true
    end
  end
end