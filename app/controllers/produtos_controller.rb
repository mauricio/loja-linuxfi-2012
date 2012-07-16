class ProdutosController < ApplicationController

  def index
    @produtos = Produto.all

    respond_to do |format|
      format.html
      format.json { render :json => @produtos }
      format.xml  { render :xml => @produtos }
    end
  end

  def show
    @produto_id = params[:id]
    @produto = Produto.find(@produto_id)
  end

end