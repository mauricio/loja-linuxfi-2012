class ItensController < ApplicationController

  def index
  end

  def destroy
    @item = pedido_atual.itens.find(params[:id])
    #@item = Item.find(params[:id])
    @item.destroy

    flash[:success] = "Item #{@item.nome} removido com sucesso"
    redirect_to itens_path
  end

  def atualizar_todos
    pedido_atual.update_attributes!(params[:pedido])

    flash[:success] = 'Quantidades atualizadas com sucesso'
    redirect_to itens_path
  end

  def create

    if self.pedido_atual.new_record?
      self.pedido_atual.save!
      session[:pedido_atual_id] = self.pedido_atual.id
    end

    @produto = Produto.find( params[:produto_id] )
    @quantidade = params[:quantidade]
    self.pedido_atual.adicionar_produto( @produto, @quantidade )

    respond_to do |format|
      format.html do
        flash[:success] = %Q!O produto #{@produto.nome} foi
          adicionado com sucesso no seu carrinho!
        redirect_to itens_path
      end
    end

  end

end