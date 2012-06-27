class ProdutosController <
  ApplicationController

  def index
    @produtos = Produto.all
  end

  def show
    @produto_id = params[:id]
    @produto =
        Produto.find(@produto_id)
  end

  def new
    @produto = Produto.new
  end

  def create
    @produto = Produto.new(params[:produto])
    if @produto.save
      redirect_to produtos_path
    else
      render :new
    end
  end

end