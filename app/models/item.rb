class Item < ActiveRecord::Base

  belongs_to :produto
  belongs_to :pedido

  validates_presence_of :quantidade,
      :pedido_id,
      :produto_id

  validates_numericality_of :quantidade,
      :integer_only => true,
      :allow_blank => true

  attr_accessible :produto_id, :produto, :quantidade

  def incrementar_quantidade( quantidade )
    self.quantidade += quantidade.to_i
  end

end