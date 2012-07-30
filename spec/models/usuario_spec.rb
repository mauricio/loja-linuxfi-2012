# encoding: utf-8
require( File.absolute_path( File.join( File.dirname(__FILE__), '..', 'spec_helper' ) ) )

describe Usuario do

  context 'em validações' do

    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:senha_em_hash) }

    it { should validate_confirmation_of(:senha) }
    it { should validate_acceptance_of(:termos_e_condicoes) }

    context 'com usuario' do

      subject do
        FactoryGirl.create(:usuario)
      end

      it { should validate_uniqueness_of(:email) }
    end

  end

  context 'em senha_necessaria?' do

    it 'deve ser necessaria quando senha_em_hash for vazio' do
      @usuario = Usuario.new
      @usuario.senha_necessaria?.should be_true
    end

    context 'com usuario no banco' do

      before do
        @usuario = FactoryGirl.create(:usuario)
      end

      it 'deve ser necessario quando o campo senha não for vazio' do
        @usuario.senha = '123456'
        @usuario.senha_necessaria?.should be_true
      end

      it 'não deve ser necessario quando o campo senha estiver em branco' do
        @usuario.senha = nil
        @usuario.senha_necessaria?.should be_false
      end

    end

  end

  context 'ao autenticar' do

    before do
      @usuario = FactoryGirl.create(:usuario)
    end

    it 'deve retornar o usuario quando os dados estiverem corretos' do
      @usuario_retornado = Usuario.autenticar(
          @usuario.email,
          '123456' )
      @usuario_retornado.should == @usuario
    end

    it 'não deve retornar o usuario se os dados estiverem incorretos' do
      @usuario_retornado = Usuario.autenticar(
          @usuario.email,
          '123459' )
      @usuario_retornado.should be_nil
    end


  end

end