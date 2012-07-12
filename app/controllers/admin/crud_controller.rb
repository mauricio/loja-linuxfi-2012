# encoding: utf-8
class Admin::CrudController < Admin::BaseController

  before_filter :load_record, :only => [
    :new,
    :edit,
    :create,
    :update,
    :destroy
  ]

  def index
    @records = paginar(record_type)
  end

  def new
    render :new
  end

  alias :edit :new

  def create
    if @record.update_attributes(params[record_name])
      flash[:success] = "#{record_human_name} foi salvo com sucesso"
      redirect_to send( "admin_#{record_name_plural}_path" )
    else
      flash.now[:error] =
          "Ocorreram erros na hora de gravar o #{record_human_name}"
      render :new
    end
  end

  alias :update :create

  def destroy
    @record.destroy
    flash[:success] = "#{record_human_name} foi removido com sucesso"
    redirect_to send( "admin_#{record_name_plural}_path" )
  end

  protected

  def load_record
    @record = if params[:id].blank?
      record_type.new
    else
      record_type.find(params[:id])
    end
  end

  def record_type
    raise %Q!Você deve implementar esse método, como em:
      def record_type
        Produto
      end!
  end

  def record_human_name
    record_type.model_name.human
  end

  def record_name
    record_type.model_name.i18n_key
  end

  def record_name_plural
    record_type.model_name.plural
  end

end