class Pedido < ActiveRecord::Base

  has_many :itens, :dependent => :destroy
  accepts_nested_attributes_for :itens
  attr_accessible :itens_attributes
  after_save :remover_itens_zerados

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

  protected

  # pedido.itens(true)
  # pedido.itens << ( um, dois, tres )
  def remover_itens_zerados
    zerados =
        self.itens.find_all { |i| i.quantidade < 1 }
    self.itens.delete( *zerados )
  end

end