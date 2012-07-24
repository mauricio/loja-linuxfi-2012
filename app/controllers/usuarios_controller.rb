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

  def atualizar_lingua
    self.usuario_atual.update_attribute( :lingua, params[:lingua])
    redirect_to :back
  end

end