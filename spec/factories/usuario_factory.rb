FactoryGirl.define do

  sequence(:email) { |n| "mail.#{n}@mail.com" }

  factory :usuario do
    email { generate(:email) }
    nome  { generate(:nome) }
    senha '123456'
    senha_confirmation '123456'
    termos_e_condicoes '1'
  end

end