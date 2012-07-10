class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :pedido_atual

  protected

  def carregar_pagina
    @pagina = params[:page] || 1
    @por_pagina = params[:per_page] || 10
  end

  def paginar( clazz )
    carregar_pagina
    clazz.paginate(
        :page => @pagina,
        :per_page => @por_pagina )
  end

  def pedido_atual
    if @pedido_atual.nil? && !session[:pedido_atual_id].nil?
      @pedido_atual =
          Pedido.find_by_id( session[:pedido_atual_id] )
    end
    @pedido_atual ||= Pedido.new
  end

end
