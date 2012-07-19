# encoding: utf-8
class SessionsController <
  ApplicationController

  def new
    @usuario = Usuario.new
    render :new
  end

  def create
    @usuario = Usuario.autenticar(
      params[:usuario][:email],
      params[:usuario][:senha]
    )

    if @usuario
      self.usuario_atual = @usuario
      flash[:success] = 'Bem vindo a loja!'
      redirect_to root_url
    else
      flash.now[:error] = 'Os dados não conferem'
      new
    end

  end

  def destroy
    reset_session
    flash[:success] =
        'O seu logoff foi feito com sucesso'
    redirect_to root_url
  end

end