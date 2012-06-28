class Produto < ActiveRecord::Base

  validates_presence_of :nome,
      :descricao,
      :preco
  validates_numericality_of :preco,
      :greater_than => 0,
      :allow_blank => true

  attr_accessible :nome, :descricao, :preco

end