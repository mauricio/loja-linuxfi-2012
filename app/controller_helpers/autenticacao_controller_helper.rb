module AutenticacaoControllerHelper

  protected

  def logged_in?
    !usuario_atual.nil?
  end

  def usuario_atual
    @usuario_atual ||= login_pela_sessao
  end

  def usuario_atual=( novo_usuario )
    session[:usuario_id] = novo_usuario.id
    @usuario_atual = novo_usuario
  end

  def login_pela_sessao

    unless session[:usuario_id].blank?
      Usuario.find_by_id( session[:usuario_id] )
    end

  end

end