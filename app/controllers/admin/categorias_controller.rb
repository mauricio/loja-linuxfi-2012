class Admin::CategoriasController <
    Admin::CrudController

  protected

  def record_type
    Categoria
  end

end