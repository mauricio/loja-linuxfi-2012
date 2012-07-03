class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :pedido_atual

  protected

  def pedido_atual
    if @pedido_atual.nil? && !session[:pedido_atual_id].nil?
      @pedido_atual =
          Pedido.find_by_id( session[:pedido_atual_id] )
    end
    @pedido_atual ||= Pedido.new
  end

end
