class Admin::ProdutosController < Admin::BaseController

  def index
    @produtos = paginar(Produto)
  end

  def new
    @produto = Produto.new
  end

  def edit
    @produto = Produto.find(params[:id])
    render :new
  end

  def create
    @produto = Produto.new
    if @produto.update_attributes(params[:produto])
      flash[:success] = 'O produto foi salvo com sucesso'
      redirect_to admin_produtos_path
    else
      flash.now[:error] =
          'Ocorreram erros na hora de gravar o produto'
      render :new
    end
  end

  def update
    @produto = Produto.find(params[:id])
    if @produto.update_attributes(params[:produto])
      flash[:success] = 'O produto foi salvo com sucesso'
      redirect_to admin_produtos_path
    else
      flash.now[:error] =
          'Ocorreram erros na hora de gravar o produto'
      render :new
    end
  end

end