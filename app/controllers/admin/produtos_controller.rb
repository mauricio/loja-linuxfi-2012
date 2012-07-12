class Admin::ProdutosController < Admin::CrudController

  protected

  def record_type
    Produto
  end

end