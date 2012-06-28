class Pedido < ActiveRecord::Base

  has_many :itens

end