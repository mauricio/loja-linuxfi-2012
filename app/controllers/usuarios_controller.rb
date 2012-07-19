class UsuariosController < ApplicationController

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      flash[:success] = 'Sua conta foi criada com sucesso'
      self.usuario_atual = @usuario
      redirect_to root_url
    else
      render :new
    end
  end

end