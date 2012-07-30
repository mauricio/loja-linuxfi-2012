# encoding: utf-8
FactoryGirl.define do

  sequence(:nome) { |n| "José #{n}" }

  factory :categoria do
    nome { generate(:nome) }
  end

end