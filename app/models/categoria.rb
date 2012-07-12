class Categoria < ActiveRecord::Base

  validates :nome,
      :presence => true,
      :uniqueness => true

  attr_accessible :nome

end