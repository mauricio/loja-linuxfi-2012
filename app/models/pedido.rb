class Pedido < ActiveRecord::Base

  has_many :itens
  accepts_nested_attributes_for :itens

  def adicionar_produto( produto, quantidade )
    if item = self.itens.detect { |i| i.produto == produto }
      item.incrementar_quantidade(quantidade)
      item.save!
    else
      self.itens.create!(
          :produto => produto,
          :quantidade => quantidade)
    end
  end

  def preco_total
    self.itens.inject( 0 ) do |acumulado,item|
      acumulado + item.preco_total
    end
  end

end